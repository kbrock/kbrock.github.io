# Blog Website Specification

A static blog for thebrocks.net.

## Decisions

| Decision | Choice |
|----------|--------|
| Hosting | GitHub Pages (AWS S3/CloudFront compatible for future) |
| Build | GitHub Actions → GitHub Pages |
| Workflow | Edit markdown locally (or on GitHub directly) |
| Icons | SVG sprite from Heroicons, hand-drawn later |
| Colors | Gray/steel blue 2-tone Mondrian-inspired |
| Code highlighting | Monokai (Rouge, server-side) |
| CSS | Pico.css (~10KB) with minimal overrides |
| Domain | thebrocks.net |
| Repository | github.com/kbrock/kbrock.github.io |

## Content Structure

**Tags** (not categories) - flat hierarchy, all tags equal:
- Broad: `life`, `health`
- Tools: `ruby`, `swift`, `ai`, `jekyll`, etc.
- Projects: `website`, `game`, etc.

Posts have multiple tags:
```yaml
---
title: Setting up Jekyll
tags: [life, website, jekyll]
---
```

Optional fields: `status` (idea, exploring, solved), `type` (project, learning, tip)

## Color Palette

```
Primary:       #4A6572  (steel blue)
Dark accent:   #1C3A4B  (dark steel)
Background:    #F5F5F5  (light gray)
Text:          #232323  (near black)
Lines/borders: #232323  (black - Mondrian style)
White:         #FFFFFF
```

---

## Task List

### Phase 1: Repository Cleanup ✓
- [x] Archive old reflectivepixel.com files to `_archive/`
- [x] Keep CNAME (thebrocks.net)
- [x] Update `.gitignore` for new structure

### Phase 2: Jekyll Foundation ✓
- [x] `_config.yml` with site metadata
- [x] `Gemfile` with jekyll, rouge, jekyll-feed, jekyll-seo-tag
- [x] `_layouts/default.html` with Pico.css
- [x] `_layouts/post.html` for articles
- [x] `_includes/header.html`, `_includes/footer.html`
- [x] Rouge Monokai syntax highlighting

### Phase 3: GitHub Actions ✓
- [x] `.github/workflows/jekyll.yml`
- [x] Build on push to master, deploy via GitHub Pages action
- [ ] Configure GitHub Pages in repo settings (Source: GitHub Actions)

### Phase 4: Pico.css + Styling ✓
- [x] Pico.css via CDN
- [x] `assets/css/custom.css` with steel blue theme
- [x] `assets/css/syntax.css` Monokai highlighting
- [x] Typography and vertical rhythm tuning

### Phase 5: Content Structure ✓
- [x] Tags system (replaces categories)
- [x] Tag pages: `/tags/life/`, `/tags/ruby/`, `/tags/ai/`, `/tags/health/`
- [x] `_layouts/tag.html` for tag index pages
- [x] Posts link to tag pages
- [x] `index.html` with article listing
- [x] `about.md` page

### Phase 6: Icons ✓ (merged into Phase 5)
- [x] `_icons/` directory for individual SVGs
- [x] `scripts/fetch_heroicon` to download from Heroicons
- [x] `scripts/build_icons.rb` to generate sprite
- [x] `_includes/icons.svg` sprite file
- [x] `_includes/icon.html` helper
- [x] `_data/icons.yml` for attribution
- [x] Initial icons: home, code-bracket, cpu-chip, heart

### Phase 7: Polish & Deploy
- [ ] Test local build: `bundle exec jekyll serve`
- [ ] Push to GitHub
- [ ] Configure GitHub Pages (Settings → Pages → Source: GitHub Actions)
- [ ] Verify thebrocks.net resolves
- [ ] Test on mobile
- [ ] Remove test post, write first real post

### Phase 8: AWS Future-Proofing (Later)
- [ ] Document S3 + CloudFront deployment
- [ ] Create AWS CDK stack template
- [ ] Add GitHub Actions workflow for S3 deploy

---

## Directory Structure

```
.
├── _config.yml
├── Gemfile
├── CNAME
├── index.html
├── about.md
├── spec.md
├── _archive/              # Old reflectivepixel.com files
├── _data/
│   └── icons.yml          # Icon attribution
├── _icons/                # Individual SVG files
│   ├── code-bracket.svg
│   ├── cpu-chip.svg
│   ├── heart.svg
│   └── home.svg
├── _includes/
│   ├── header.html
│   ├── footer.html
│   ├── icon.html          # {% include icon.html name="ruby" %}
│   └── icons.svg          # Generated sprite
├── _layouts/
│   ├── default.html
│   ├── post.html
│   └── tag.html
├── _posts/
│   └── YYYY-MM-DD-title.md
├── assets/css/
│   ├── custom.css
│   └── syntax.css
├── scripts/
│   ├── build_icons.rb     # Generates _includes/icons.svg
│   └── fetch_heroicon     # Downloads icon from Heroicons
├── tags/
│   ├── ai.md
│   ├── health.md
│   ├── life.md
│   └── ruby.md
└── .github/workflows/
    └── jekyll.yml
```

---

## Common Tasks

### Add a new tag with icon
```bash
cd _icons && ../scripts/fetch_heroicon sparkles
# Add entry to _data/icons.yml
ruby scripts/build_icons.rb
# Create tags/newtag.md
```

### Add a hand-drawn icon
1. Scan at 300+ DPI
2. Vectorize (Inkscape, Vectornator)
3. Save as 24x24 SVG to `_icons/`
4. Add attribution to `_data/icons.yml`
5. Run `ruby scripts/build_icons.rb`

### Write a new post
```bash
# Create _posts/YYYY-MM-DD-title.md
---
title: Your Title
tags: [life, ruby, jekyll]
---

Your content here...
```

### Local development
```bash
bundle install
bundle exec jekyll serve
# Visit http://localhost:4000
```

---

## Resources

- Pico.css: https://picocss.com
- Heroicons: https://heroicons.com
- Jekyll: https://jekyllrb.com/docs/
- Rouge themes: `rougify help style`

---

## Notes

- Old site was reflectivepixel.com - archived, not migrated
- Keep build portable for AWS migration
- Resist adding features - simplicity first
- Hand-drawn icons replace Heroicons over time
- Use chruby: `source /usr/local/share/chruby/chruby.sh && chruby 3.3.4`
