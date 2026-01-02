# Sparks & Stories

Purpose: How to create content.

For architecture details, see CLAUDE.md.
For technology decisions, see spec.md.
For task tracking, see TODO.md.

## Quick Start

```bash
source /usr/local/share/chruby/chruby.sh && chruby 3.3.4
bundle install
bundle exec jekyll serve
# Visit http://localhost:4000
```

## Content Types

| Type         | Location   | Purpose                              |
| ------------ | ---------- | ------------------------------------ |
| Sparks       | `_sparks/` | Raw thoughts, half-baked ideas and anecdote |
| Posts        | `_posts/`  | Story with a hypothesis\* and an arc |
| Presentations| `_posts/`  | Reveal.js slides (layout: reveal)    |
| Tags         | `tags/`    | Thread/Theme. This can add friction  |

\* A hypothesis can just be a point.

## Glossary of Concepts

Feel like these are building blocks and though thoughts on these are scattered about, they need a single spot for capture. Maybe these are tags?
It would be nice if the structure of the site reflected these.

|        Term       | Synonyms | Definition |
| ----------------- | ----------------- | ---------- |
| **Spark**         | inspiration, observation, problem, example,  | A quick small thought - possibly half-baked. |
| **Pattern**       | theme, thread, prejudice, rule, common sense | A recurring structure across sparks. Not a conclusion. Possibly a tag or category |
| **Post**          | story, presentation, essay, narrative | Linearized output. Has a hypothesis beginning, middle, end. Audience-ready.  |
| **Hypothesis**    | thesis, summary, conclusion, take away, subject, the point | The \"if X then Y\" statement. Goes at the top (Churchill style). Can be wrong. |
| **Preconception** | prejudice, experience, common sense, starting point | What the reader brings. Affects how they hear your story. |
| **Translation**   | linearization, conversion | The work of turning non-linear patterns into linear narratives. |
| **Friction**      | - | What stops you from writing |

## Creating Content

```bash
bin/post My Post Title                    # Create a post
bin/post --spark My Spark Title           # Create a spark  
bin/post --presentation My Slides         # Create a presentation
bin/post My Post --tag ruby --tag ai      # Post with tags
```

Templates: `_posts/_templates/` and `_sparks/_templates/`

## Adding Icons

```bash
bin/icon heart                  # Download UI icon (Heroicons)
bin/icon --brand ruby           # Download brand icon (Simple Icons)
bin/icon --brand ruby --tag ruby # Also create tag entry
```

Icons go in `_icons/` . Icon Metadata in `_data/icons.yml`.
Tags  go in `tags/`.    Tag  Metadata in `_data/tags.yml`.
