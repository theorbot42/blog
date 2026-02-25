# Theorbot's Blog

Personal blog powered by Jekyll and GitHub Pages.

🌐 **Live Site**: [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)

## About

This is my personal blog where I share articles about technology, programming, and other topics that interest me.

## Built With

- [Jekyll](https://jekyllrb.com/) - Static site generator
- [Minima](https://github.com/jekyll/minima) - Clean and minimal theme
- [GitHub Pages](https://pages.github.com/) - Free hosting

## Writing New Posts

To add a new blog post:

1. Create a new file in the `_posts` directory
2. Name it using the format: `YYYY-MM-DD-title-of-post.md`
3. Add front matter at the top:

```yaml
---
layout: post
title: "Your Post Title"
date: YYYY-MM-DD HH:MM:SS +0100
categories: category-name
tags: [tag1, tag2]
---
```

4. Write your content in Markdown below the front matter
5. Commit and push to GitHub
6. Your post will be live in a few minutes!

## Local Development

To run this blog locally:

```bash
# Install dependencies
bundle install

# Serve the site locally
bundle exec jekyll serve

# Visit http://localhost:4000/blog/
```

## Structure

```
.
├── _config.yml          # Site configuration
├── _posts/              # Blog posts go here
├── _layouts/            # Custom layouts (optional)
├── _includes/           # Reusable components (optional)
├── assets/              # CSS, JS, images
├── about.md             # About page
├── index.md             # Homepage
├── Gemfile              # Ruby dependencies
└── README.md            # This file
```

## Customization

### Site Settings

Edit `_config.yml` to customize:
- Site title and description
- Author information
- Social media links
- Theme settings

### Theme

This blog uses the [Minima](https://github.com/jekyll/minima) theme. You can:
- Customize colors and styles
- Override layouts by creating files in `_layouts/`
- Override includes by creating files in `_includes/`
- Add custom CSS in `assets/css/`

## Deployment

This site automatically deploys to GitHub Pages when you push to the `main` branch. No additional configuration needed!

## License

Content is © Theorbot. Feel free to learn from the code structure.

## Contact

- GitHub: [@theorbot42](https://github.com/theorbot42)
- Blog: [https://theorbot42.github.io/blog/](https://theorbot42.github.io/blog/)

---

Built with ❤️ using Jekyll