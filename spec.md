# Blog Website Specification

Purpose: Technology choices and implementation decisions.

For content creation, see README.md.
For architecture details, see CLAUDE.md.
For task tracking, see TODO.md.

## Technologies

| Technology        | Version | URL                         | Notes                  |
| ----------------- | ------- | --------------------------- | ---------------------- |
| Jekyll            | 4.3     | https://jekyllrb.com        | Static site generator  |
| Pico.css          | 2.0.6   | https://picocss.com         | CSS framework          |
| Reveal.js         | 5.1     | https://revealjs.com        | Presentations          |
| Rouge             | -       | (bundled with Jekyll)       | Syntax highlighting    |
| jekyll-minibundle | -       | (gem)                       | Asset fingerprinting   |
| Simple Icons      | -       | https://simpleicons.org     | Brand icons            |
| Heroicons         | -       | https://heroicons.com       | UI icons (solid)       |

## Hosting

- **Current:** GitHub Pages with GitHub Actions build
- **Option:** AWS S3/CloudFront for more control

## Content Types

- **Posts:** Blog entries with tags
- **Presentations:** Reveal.js slides

## Decisions

| Decision                      | Choice                                              |
| ----------------------------- | --------------------------------------------------- |
| Taxonomy                      | Tags (flat, multiple per post) over categories     |
| Icons                         | SVG sprite, external file, fingerprinted           |
| Icon style                    | Prefer solid/filled versions                       |
| Syntax highlighting           | Server-side (Rouge), no client JS                  |
| Vendor files                  | Local with version in filename (assets/)           |
| Site CSS                      | Fingerprinted (_assets/)                           |
| Reveal.js theme               | Map --r-* variables to Pico in theme.css           |
| Code highlighting theme       | Rouge Monokai duplicated locally in syntax.css     |

## Color Palette

| Theme | Teal    | Text    | Background |
| ----- | ------- | ------- | ---------- |
| Light | #0d9488 | #666666 | #F5F5F5    |
| Dark  | #2dd4bf | #c9c9c9 | #1a1a1a    |
