# thebrocks.net

Purpose: How to create content and add icons.

For architecture details, see CLAUDE.md.
For technology decisions, see spec.md.
For task tracking, see TODO.md.

## Quick Start

```bash
# Setup Ruby environment
source /usr/local/share/chruby/chruby.sh && chruby 3.3.4

# Install dependencies
bundle install

# Local development
bundle exec jekyll serve
# Visit http://localhost:4000

# Build site
bundle exec jekyll build
```

## Writing Posts

```bash
bin/new_post My Post Title
```

Creates `_posts/2025-01-01-my-post-title.md`:

```yaml
---
title: My Post Title
tags: []
---
```

### Front Matter

| Field  | Required | Description                                  |
| ------ | -------- | -------------------------------------------- |
| title  | yes      | Post title                                   |
| tags   | no       | Array of tags, e.g. `[life, ruby]`           |
| layout | no       | `post` (default) or `reveal` for slides      |

## Writing Presentations

Use `layout: reveal` in front matter. Slide separators:

| Separator | Effect                          |
| --------- | ------------------------------- |
| `---`     | Next slide (right arrow)        |
| `++`      | Open vertical section (down)    |
| `--`      | Close vertical section          |

Note: `--` must be alone on its own line. Kramdown converts it to an emdash, which the template uses to detect section closes. Inline `--` within text is not affected.

## Adding Icons

```bash
# Brand icons (Simple Icons) - ruby, github, swift, etc.
bin/download_brand_icon ruby github swift

# UI icons (Heroicons solid) - heart, home, etc.
bin/download_icon heart home

# Rebuild sprite
bin/build_icons
```

## Mapping Tags to Icons

Icons can represent tags. Edit `_data/tag_icons.yml` to map tag names to icon names. Tags without a mapping use `heart` as the default.
