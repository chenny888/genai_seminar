# AI & Data Science for Operations

A simple two-page **Hugo** site for an online workshop series, using the Hugo Academic template ([HugoBlox Kit](https://github.com/HugoBlox/kit)) with its **Minimal** theme. The home page has the vision, logistics, upcoming talks, and organizers; `/past-talks/` is the archive.

Intended repository: `chenny888/genai_seminar`  
Website URL after publication: **https://chenny888.github.io/genai_seminar/**

## Preview and build

HugoBlox needs Hugo (extended), Go, and Node.js.

```sh
brew install hugo go node
corepack pnpm install
hugo server
```

Open the local URL Hugo prints. `hugo --gc --minify` writes the static site to `public/`.

## Edit content

| File | What to edit |
| --- | --- |
| `content/_index.md` | Home page: vision, time and link, upcoming talks, organizers |
| `content/past-talks.md` | Past talks |
| `config/_default/params.yaml` | Site name, description, theme (`minimal`), footer contact |
| `config/_default/hugo.yaml` | Website URL |
| `layouts/_partials/site_footer.html` | Footer (overrides HugoBlox's to omit its "Made with Hugo Blox" banner) |

Each talk is a short Markdown entry in the `text` of the talks block:

```markdown
### Talk title
**Speaker Name**, University · Jan 20, 2027, 12:00 p.m. ET

Abstract.

[Paper](https://…)
```

After a talk, move its entry from `content/_index.md` to `content/past-talks.md`.

## Publish

Sign into GitHub as `chenny888`, then run the first-publication script:

```sh
gh auth login --hostname github.com --git-protocol https --web
bash scripts/publish.sh
```

It builds the site, commits it, creates the public `chenny888/genai_seminar` repository, pushes `main`, enables GitHub Pages, and starts the deployment. After that, every push to `main` rebuilds and deploys the site via `.github/workflows/deploy.yml`.
