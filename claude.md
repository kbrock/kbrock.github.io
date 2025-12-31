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

Icons are SVG sprites. To add a new icon:

```bash
cd _icons
../scripts/fetch_heroicon icon-name    # Download from Heroicons
# Add to _data/icons.yml for attribution
ruby ../scripts/build_icons.rb         # Regenerate sprite
```

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

## Future Ideas

- **Mermaid diagrams**: Inline flowcharts in markdown (see `_archive/_posts/_drafts/00_flow.md` for old dot syntax experiments)
- **D3 visualizations**: Simplify old complex JS approach, possibly with AI help
- **Draft inbox**: Single document for half-baked ideas (like old `_archive/_posts/_drafts/000_inbox.md`)
- **Presentation ↔ Post**: Same content, different layouts?

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
