# Claude Code Context

## Project Overview

Static blog for thebrocks.net built with Jekyll, hosted on GitHub Pages.

## Tech Stack

- **Jekyll 4.3** - Static site generator
- **Pico.css** - Minimal CSS framework (via CDN)
- **Rouge** - Syntax highlighting (Monokai theme)
- **GitHub Actions** - Build and deploy

## Ruby Environment

```bash
source /usr/local/share/chruby/chruby.sh && chruby 3.3.4
```

## Key Files

| File | Purpose |
|------|---------|
| `_config.yml` | Jekyll configuration |
| `_layouts/default.html` | Base layout with Pico.css |
| `_layouts/post.html` | Individual post layout |
| `_layouts/tag.html` | Tag index page layout |
| `_includes/icon.html` | Icon helper: `{% include icon.html name="ruby" %}` |
| `_includes/icons.svg` | Generated SVG sprite (don't edit directly) |
| `assets/css/custom.css` | Theme overrides (steel blue Mondrian) |
| `assets/css/syntax.css` | Monokai code highlighting |

## Content Structure

Posts use **tags** (not categories). Multiple tags per post:

```yaml
---
title: My Post
tags: [life, website, jekyll]
---
```

Tag pages live in `tags/*.md` with layout `tag`.

## Icons Workflow

Icons are SVG sprites stored in `_icons/`. Prefer **solid/filled** versions.

### Icon Sources

| Type | Source | URL |
|------|--------|-----|
| Brand logos | Simple Icons | https://simpleicons.org |
| UI icons (solid) | Heroicons | https://heroicons.com |

### Fetching Icons

```bash
cd _icons

# Simple Icons (brands: ruby, swift, claude, github, manageiq, etc.)
curl -s "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/ICONNAME.svg" -o ICONNAME.svg

# Heroicons solid (UI: home, heart, etc.)
curl -s "https://raw.githubusercontent.com/tailwindlabs/heroicons/master/src/24/solid/ICONNAME.svg" -o ICONNAME.svg

# Rebuild sprite after adding
ruby scripts/build_icons.rb
cp _includes/icons.svg assets/icons.svg
```

### Current Icons

- **Brands (Simple Icons)**: claude, facebook, github, ibm, instagram, jekyll, linkedin, manageiq, redhat, ruby, swift, x
- **UI (Heroicons solid)**: heart, home
- **Legacy (Heroicons outline)**: code-bracket, cpu-chip

### Tag to Icon Mapping

Edit `_data/tag_icons.yml` to map tags to icons.

Use in templates: `{% include icon.html name="icon-name" %}`

## Common Commands

```bash
# Local development
bundle exec jekyll serve

# Build icons after adding to _icons/
ruby scripts/build_icons.rb

# Fetch a Heroicon
cd _icons && ../scripts/fetch_heroicon heart
```

## Design Decisions

- **Tags over categories**: Flat hierarchy, posts can have multiple
- **SVG sprite**: Icons defined once, referenced with `<use>`
- **No icon library download**: Just copy the few SVGs needed
- **Pico.css via CDN**: Minimal footprint, no build step
- **Server-side highlighting**: Rouge, no JS needed

## Color Palette

```css
--steel-blue: #4A6572;
--steel-dark: #1C3A4B;
--gray-light: #F5F5F5;
--near-black: #232323;
```

## Writing Guidelines (from 2014 goals)

- Only one concept per post
- Only one-two pages per post
- Max one new technology per post
- Max one new category of metadata per post

## Past Goals (2014)

Original deliverables for a presentation workflow project:
- A workflow for moving ideas from concept to a presentation
- A post to describe each of the workflow steps
- A list of tools for each of the workflow steps
- A classification scheme to group posts together
- Tools for expressing ideas (e.g. graphs, powerpoints, prose)
- Presentations

## Future Ideas

- **Mermaid diagrams**: Inline flowcharts in markdown (see `_archive/_posts/_drafts/00_flow.md` for old dot syntax experiments)
- **D3 visualizations**: Simplify old complex JS approach, possibly with AI help
- **Draft inbox**: Single document for half-baked ideas (like old `_archive/_posts/_drafts/000_inbox.md`)
- **Presentation ↔ Post**: Same content, different layouts? (one being a presentation and the other a blog post)

## Reveal.js Presentations

Use `layout: reveal` in front matter. Slide separators:
- `---` = next slide (right arrow)
- `++` = open vertical sub-section (down arrow)  
- `--` = close vertical sub-section (Kramdown converts to emdash)

Future:
- Speaker notes (`Note:` syntax)
- Custom themes leveraging site CSS

## Pending Work

See `spec.md` for full task list.
