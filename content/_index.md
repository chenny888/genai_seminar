---
# Leave the homepage title empty to use the site title
title: ''
summary: ''
type: landing

sections:
  - block: markdown
    id: about
    content:
      title: AI & Data Science for Operations
      text: |-
        *An online workshop series*

        This workshop brings together researchers working on the intersection of generative AI, machine learning, and data science in operations research and operations management. Our aim is to share emerging ideas, discuss new methods, and connect them with operations and decision-making.
    design:
      columns: '1'
      # Soft gradient in the theme colours
      background:
        gradient_mesh:
          enable: true
          animation: none
  - block: markdown
    id: logistics
    content:
      title: Time and link
      text: |-
        **When:** To be announced. Dates and times will be posted with each talk.

        **Where:** Online. Meeting link to be announced.
    design:
      columns: '1'
  - block: markdown
    id: upcoming
    content:
      title: Upcoming talks
      # One entry per talk: title, speaker and date, abstract, and an optional paper link.
      # After the talk, move its entry to content/past-talks.md.
      text: |-
        ### Talk title (placeholder)
        **Speaker Name**, University · Date and time to be announced

        A one-paragraph abstract of the talk will appear here, followed by a link to the related paper if one is available.

        [Paper ↗](#)

        ---

        [See past talks →](past-talks/)
    design:
      columns: '1'
      background:
        color:
          light: '#f6f8fa'
          dark: '#161b22'
  - block: markdown
    id: organizers
    content:
      title: Organizers
      text: |-
        - J. George Shanthikumar — Purdue University
        - Cong Shi — University of Miami
        - Ningyuan Chen — University of Toronto
    design:
      columns: '1'
---
