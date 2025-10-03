# Recregt Blog

Personal blog featuring university course notes and educational content.

## 🎓 Content Categories

- **Mathematics** - Calculus, algebra, and mathematical concepts
- **Physics** - Classical mechanics, electromagnetism, and physics fundamentals
- **Computer Science** - Data structures, algorithms, and CS theory
- **Programming** - OOP, design patterns, and coding best practices

## 🚀 Built With

- [Hugo](https://gohugo.io/) - Static site generator
- [PaperMod Theme](https://github.com/adityatelange/hugo-PaperMod) - Hugo theme

## 💻 Local Development

### Prerequisites

- Hugo Extended v0.112.0 or higher

### Running Locally

```bash
# Clone the repository
git clone https://github.com/recregt/recregt-blog.git
cd recregt-blog

# Initialize submodules (for theme)
git submodule update --init --recursive

# Run the development server
hugo server

# Build for production
hugo --minify
```

The site will be available at `http://localhost:1313/`

## 📁 Project Structure

```
recregt-blog/
├── archetypes/          # Content templates
├── content/             # Blog content
│   ├── mathematics/     # Math articles
│   ├── physics/         # Physics articles
│   ├── computer-science/# CS articles
│   └── programming/     # Programming articles
├── layouts/             # Custom layout overrides
├── static/              # Static files (images, etc.)
├── themes/              # Hugo themes
│   └── PaperMod/        # PaperMod theme (submodule)
└── hugo.toml           # Site configuration
```

## ✨ Features

- 📚 Organized by lessons (categories)
- 🏷️ Topics (tags) grouped by lessons
- 🔍 Full-text search functionality
- 📱 Responsive design
- 🌙 Dark/light mode
- ⚡ Fast loading times
- 📊 Math equation support (KaTeX)
- 🎨 Syntax highlighting for code

## 📝 Creating New Content

```bash
# Create a new article
hugo new content/<lesson>/<topic-name>/index.md

# Example: Create a new math article
hugo new content/mathematics/linear-algebra/index.md
```

Edit the frontmatter:
```yaml
---
title: "Your Article Title"
date: 2025-10-04
draft: false
topics: ["topic1", "topic2"]
lessons: ["Lesson Name"]
math: true
description: "Article description"
---
```

## 🌐 Live Site

Visit the blog at: [blog.recregt.com](https://blog.recregt.com)

## 📄 License

Content is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)

## 👤 Author

**Ömer Tekin**

- Website: [recregt.com](https://recregt.com)
- GitHub: [@recregt](https://github.com/recregt)
- Twitter: [@recregt](https://twitter.com/recregt)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

---

Made with ❤️ and Hugo
