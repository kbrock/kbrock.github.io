# Blog Website Specification

A static blog for thebrocks.net covering Ruby, Swift, AI, and Health.

## Decisions

| Decision | Choice |
|----------|--------|
| Hosting | GitHub Pages (AWS S3/CloudFront compatible for future) |
| Build | GitHub Actions → `gh-pages` branch |
| Workflow | Edit markdown locally (or on GitHub directly) |
| Icons | Hybrid: Copy individual Heroicons SVGs, hand-drawn later |
| Colors | Gray/steel blue 2-tone Mondrian-inspired |
| Code highlighting | Monokai (Rouge, server-side) |
| CSS | Pico.css (~10KB) with minimal overrides |
| Domain | thebrocks.net |
| Repository | github.com/kbrock/kbrock.github.io |

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

### Phase 1: Repository Cleanup
- [ ] Archive old reflectivepixel.com files to `_archive/` or remove
- [ ] Keep CNAME (thebrocks.net)
- [ ] Clean up old `_posts/`, `_layouts/`, `_includes/`, `_sass/`
- [ ] Update `.gitignore` for new structure
- [ ] Commit: "Fresh start for thebrocks.net"

### Phase 2: Jekyll Foundation
- [ ] Update `_config.yml` (site title, url, author, etc.)
- [ ] Update `Gemfile` (jekyll, rouge, jekyll-feed, jekyll-seo-tag)
- [ ] Create `_layouts/default.html` with Pico.css
- [ ] Create `_layouts/post.html` for articles
- [ ] Create `_includes/header.html`, `_includes/footer.html`
- [ ] Configure Rouge for Monokai: `rougify style monokai`

### Phase 3: GitHub Actions
- [ ] Create `.github/workflows/jekyll.yml`
- [ ] Build on push to `main`
- [ ] Deploy to `gh-pages` branch
- [ ] Configure GitHub Pages to serve from `gh-pages`

### Phase 4: Pico.css + Styling
- [ ] Add Pico.css (CDN or local copy)
- [ ] Create `assets/css/custom.scss` for overrides
- [ ] Implement gray/steel blue color scheme
- [ ] Style code blocks with Monokai
- [ ] Tune typography / vertical rhythm
- [ ] Test dark/light contrast

### Phase 5: Content Structure
- [ ] Create category system (Ruby, Swift, AI, Health)
- [ ] Update `index.html` with article listing
- [ ] Create category pages or tag filtering
- [ ] Create `about.md`
- [ ] Add article metadata template (title, date, category, icon)

### Phase 6: Icons
- [ ] Copy needed Heroicons SVGs to `_includes/icons/` (~4-8 icons)
- [ ] Create topic icons: Ruby, Swift, AI, Health
- [ ] Integrate into article headers via Liquid includes
- [ ] Document hand-drawn workflow:
  - Scan 300+ DPI, high contrast
  - Vectorize (Inkscape, Vectornator, or similar)
  - Optimize SVG
  - Replace Heroicons incrementally

### Phase 7: Polish & Deploy
- [ ] Add RSS feed (jekyll-feed)
- [ ] Test GitHub Pages build
- [ ] Verify thebrocks.net resolves correctly
- [ ] Test on mobile
- [ ] Write first blog post

### Phase 8: AWS Future-Proofing (Later)
- [ ] Document S3 + CloudFront deployment
- [ ] Create AWS CDK stack template
- [ ] Add GitHub Actions workflow for S3 deploy

---

## Resources

- Pico.css: https://picocss.com
- Heroicons: https://heroicons.com (copy individual SVGs as needed)
- Rouge/Monokai: `rougify style monokai > assets/css/syntax.css`
- Jekyll: https://jekyllrb.com/docs/
- GitHub Actions for Jekyll: https://jekyllrb.com/docs/continuous-integration/github-actions/

---

## Notes

- Old site was reflectivepixel.com - content archived, not migrated
- Keep build portable for AWS migration
- Resist adding features - simplicity first
- Icons: just copy the ~4-8 SVGs you need, no library download
- Hand-drawn icons replace Heroicons over time
