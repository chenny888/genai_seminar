#!/usr/bin/env bash
# First publication of the HugoBlox site, using the authenticated GitHub CLI.
set -euo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"

gh auth status
github_owner="$(gh api user --jq .login)"
if [[ "$github_owner" != "chenny888" ]]; then
  echo "Expected GitHub account chenny888; active account is $github_owner." >&2
  exit 1
fi

for tool in hugo go corepack; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "Install Hugo, Go, and Node.js first: brew install hugo go node" >&2
    exit 1
  fi
done
COREPACK_ENABLE_DOWNLOAD_PROMPT=0 corepack pnpm install
hugo --gc --minify
if [[ ! -d .git ]]; then
  git init -b main
fi
if [[ "$(git branch --show-current)" != "main" ]]; then
  echo "Expected the local main branch. No repository was created." >&2
  exit 1
fi
if git remote get-url origin >/dev/null 2>&1; then
  echo "An origin remote already exists. Use git push for subsequent updates." >&2
  exit 1
fi

git add .gitignore .npmrc .github README.md config content layouts go.mod go.sum hugoblox.yaml package.json pnpm-lock.yaml scripts
if ! git diff --cached --quiet; then
  git commit -m "Create Hugo workshop website"
fi
gh repo create "$github_owner/genai_seminar" \
  --public \
  --description "AI & Data Science for Operations — online workshop series" \
  --source=. --remote=origin --push

gh api --method POST "repos/$github_owner/genai_seminar/pages" \
  -f build_type=workflow --jq .html_url

# Start a build after Pages is enabled, even if the initial push ran before setup.
gh workflow run deploy.yml --repo "$github_owner/genai_seminar" --ref main

echo "Source pushed. Hugo is building at https://github.com/$github_owner/genai_seminar/actions"
echo "Website URL after deployment: https://$github_owner.github.io/genai_seminar/"
