# Claude Code Context

Purpose: Architecture and context for AI assistants modifying this codebase.

For content creation, see README.md.
For technology decisions, see spec.md.
For task tracking, see TODO.md.

## Ruby Environment

    source /usr/local/share/chruby/chruby.sh && chruby 3.3.4

## Content Model

Two content types: sparks (raw thoughts) and stories (polished posts).

| Type    | Collection | Layout  | Title Source                     |
| ------- | ---------- | ------- | -------------------------------- |
| Spark   | `_sparks`  | spark   | Filename (date prefix stripped)  |
| Post    | `_posts`   | post    | Front matter `title:`            |
| Slides  | `_posts`   | reveal  | Front matter `title:`            |

Sparks use `sparked-by:` in front matter for cross-references. Rendered in footer as links.

Templates: `_posts/_templates/` and `_sparks/_templates/`

## Asset Fingerprinting

CSS and icons are fingerprinted using jekyll-minibundle's `ministamp` tag.

Use absolute paths with leading slash: `/assets/css/theme.css` not `assets/css/theme.css`.

## Layouts

| Layout       | Extends | Notes                            |
| ------------ | ------- | -------------------------------- |
| default.html | -       | Base layout, sets icons_path     |
| post.html    | default | Blog posts                       |
| spark.html   | default | Sparks with sparked-by footer      |
| tag.html     | default | Tag listing pages                |
| reveal.html  | -       | Standalone, sets own icons_path  |

Note: reveal.html does not extend default.html. Changes to head, CSS includes, or icons_path in one may need to be mirrored in the other.

## Includes

| Include            | Used By              | Notes                         |
| ------------------ | -------------------- | ----------------------------- |
| header.html        | default              | Site header with social icons |
| footer.html        | default              | Site footer                   |
| post-summary.html  | index.html, tag.html | Post listing                  |
| spark-summary.html | sparks.html          | Spark listing (title only)    |

## CSS Variables

theme.css overrides Pico variables and maps Reveal.js variables.

Theme selectors:
- Light: [data-theme=light], :root:not([data-theme=dark])
- Dark: [data-theme=dark]

Reveal.js mapping in :root:

    --r-background-color: var(--pico-background-color);
    --r-main-color: var(--pico-color);
    --r-link-color: var(--pico-primary);

## Icons

icons.svg is an external file (not inline). The `ministamp` tag generates the fingerprinted path, and we capture it into a variable so includes can use it:

    {% capture icons_path %}{% ministamp _assets/icons.svg /assets/icons.svg %}{% endcapture %}

This must be done in each standalone layout (default.html, reveal.html). Includes like post-summary.html expect `icons_path` to exist.

## Notes

- syntax.css duplicates Rouge Monokai theme locally (allows customization)
- Versioned vendor files (pico-2.0.6.css, reveal-5.1/) go in assets/
- Fingerprinted files go in _assets/

## Style Preferences

- Tables should have spaces for readability
- Purpose statement at top of each documentation file
