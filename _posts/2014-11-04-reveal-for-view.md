---
layout: reveal
title:  "Reveal Templates"
date:   2014-11-04
category: presentation
noun: view
technology: reveal
vertical_center: false

---

Creating a revealjs presentation in Jekyll.

@kbrock

---

## Jekyll

- highlights code [keep]
- leverages sass [keep]
- converts markdown to html [keep]
- merges content into a boilerplate <small>(e.g.: [reveal.html][])</small>

[reveal.html]: https://github.com/kbrock/kbrock.github.io/blob/master/_layouts/reveal.html

---

## reveal.js

++

- slide boundaries (right arrow)
- sub slide boundary (down arrow)
- code highlighting (remove)
- themes

---

Markdown uses `---` to produce an `<hr>`.
Put these to mark the next slide:

```liquid
<section>
{ { content | replace: "<hr />", "</section><section>" }}
</section>
```

---

add 2 custom tags to change navigation: `++`, `--`:

```liquid
<section>
{ { content |
    replace: "<hr />", "</section><section>" |
    replace: "<p>++</p>", "<section>" |
    replace: "<p>–</p>", "</section>" }}
</section>
```

<small>Note: that is `&emdash` not `--`.</small>

---

```ruby
def good stuff
  x = exit(1)
end
```

## remove code highlighting

- Just remove the javascript file and styles

---

## Themes files

- `css/theme/default.scss`
- `_sass/theme/_mixins.css`
- `_sass/theme/template/{_settings.scss,_theme.scss}`

---

### Theme changes

- make `@import`s non relative.
- include reference to `syntax-highlighting`
- add frontmatter to `default.scss`
- remove extra theme support in boilerplace.

---

## Theme decisions

- outstanding: Want to just site wide theme

--

---

post declares boilerplate in frontmatter:

```yaml
---
layout: reveal
---
```

Use this [presentation][] for an example.

[presentation]: https://github.com/kbrock/kbrock.github.io/blob/master/_posts/2014-11-04-reveal-for-view.md

---

The most work was fixing the css.
(still outstanding)

---
