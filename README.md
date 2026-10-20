# SycamoreQ's Emacs — The Black Swordsman Edition

A minimalist, high-performance GNU Emacs configuration forged in pure black (`#000000`) and blood red (`#FF0000`). Designed for systems programming, note-taking, and technical blogging with modal editing.


I thought since a lot of people do put up their Emacs config and they get blown up, why would I not want that lol. I am still learning Emacs and this is also a fun project to learn about it. 

The rest is AI summarized. 
---

## Highlights

* **Package Management**: Automated bootstrap via [`straight.el`](https://github.com/radian-software/straight.el) and `use-package` for fully reproducible environments.
* **Modal Editing**: Full Vim keybindings via `evil-mode` and `evil-collection`, with an extensible `SPC` leader key configured via `general.el`.
* **Minibuffer & Completion**:
  * **Vertico**: Minimalist vertical completion UI.
  * **Marginalia**: Rich file, command, and buffer annotations in the minibuffer.
  * **Orderless**: Flexible space-separated fuzzy matching.
  * **Corfu**: Fast, lightweight inline autocomplete popup.
  * **Consult & Embark**: Enhanced search commands and contextual actions.
* **Blogging & Markdown**:
  * **Native Code Block Highlighting**: Full syntax highlighting within fenced markdown code blocks across 15+ languages (`python`, `js`, `ts`, `tsx`, `rust`, `go`, `bash`, `c`, `json`, `yaml`, etc.).
  * **Isolated Block Editing**: Edit code snippets in a full major-mode buffer with completion and indentation (`SPC m c '` or `C-c '`).
  * **Live Browser Preview**: Real-time websocket preview in your web browser (`markdown-preview-mode`, `SPC m p p`).
  * **Split Buffer Preview**: In-Emacs side-by-side rendered preview via built-in `eww` (`SPC m p e`).
  * **Table of Contents**: Automatic markdown TOC generation and updates (`markdown-toc`, `SPC m t g`).
  * **Blog Post Stats**: Instant word count, character count, and estimated reading time calculation (`SPC m s`).
  * **Distraction-Free Mode**: Focused centered prose writing with soft margins via `olivetti-mode` (`SPC m z`).
  * **Post Scaffolding**: Fast Astro / SSG blog post generator (`SPC m n`).
* **Org Mode**:
  * Custom TODO workflow (`TODO`, `NEXT`, `WAIT`, `DONE`, `KILL`) styled in blood red and gray.
  * Fast capture templates for tasks, journal entries, and blog ideas (`SPC o c`).
  * Modern bullets with `org-modern` and dynamic markup reveal with `org-appear`.
* **Git Porcelain**: Full `magit` suite and fringe git diff markers with `diff-hl`.
* **Terminal Integration**:
  * Adapts cleanly to terminal frames (`emacs -nw` inside Ghostty) by inheriting terminal backgrounds seamlessly without color mismatch.
* **The Brand of Sacrifice Splash Screen**: Custom dynamic ASCII/braille splash screen featuring Berserk quotes and fast navigation shortcuts.

---

## Keybindings (`SPC` Leader)

Press `SPC` in normal mode (or `M-SPC` anywhere) to access the leader menu:

### 📝 Writing & Markdown (`SPC m`)

| Key | Command | Description |
| :--- | :--- | :--- |
| `SPC m p p` | `markdown-preview-mode` | Open real-time live browser preview |
| `SPC m p e` | `markdown-live-preview-mode` | Side-by-side live preview inside Emacs (`eww`) |
| `SPC m p b` | `markdown-export-and-preview` | Pandoc standalone HTML export and open browser |
| `SPC m c '` / `C-c '` | `markdown-edit-code-block` | Edit code block in native language buffer |
| `SPC m c i` | `markdown-insert-gfm-code-block` | Insert fenced code block with language prompt |
| `SPC m s` | `berserk-blog-stats` | Show word count and estimated reading time |
| `SPC m t g` | `markdown-toc-generate-toc` | Insert auto-generated Table of Contents |
| `SPC m t r` | `markdown-toc-refresh-toc` | Refresh existing Table of Contents |
| `SPC m i l` | `markdown-insert-link` | Insert markdown hyperlink |
| `SPC m i i` | `markdown-insert-image` | Insert markdown image |
| `SPC m i v` | `markdown-toggle-inline-images`| Toggle inline image rendering |
| `SPC m z` | `olivetti-mode` | Toggle centered distraction-free focus mode |
| `SPC m n` | `berserk-new-blog-post` | Scaffold a new blog post |

### Files & Buffers

| Key | Command | Description |
| :--- | :--- | :--- |
| `SPC .` / `SPC f f` | `find-file` | Open or find file |
| `SPC ,` / `SPC b b` | `switch-to-buffer` | Switch active buffer |
| `SPC f s` | `save-buffer` | Save current file |
| `SPC f r` | `recentf-open-files` | Browse recent files |
| `SPC b k` / `SPC k` | `kill-current-buffer` | Close active buffer |

### Windows & Navigation

| Key | Command | Description |
| :--- | :--- | :--- |
| `SPC w v` | `split-window-right` | Split window vertically |
| `SPC w s` | `split-window-below` | Split window horizontally |
| `SPC w d` | `delete-window` | Close window split |
| `SPC w h / j / k / l` | `windmove-*` | Navigate between window splits |
| `SPC j j` | `avy-goto-char-timer` | Jump to visible character on screen |
| `SPC j l` | `avy-goto-line` | Jump to visible line |

### ⚔ Org Mode & Git

| Key | Command | Description |
| :--- | :--- | :--- |
| `SPC o a` | `org-agenda` | Open agenda view |
| `SPC o c` | `org-capture` | Quick capture template |
| `SPC o l` | `org-store-link` | Store org link |
| `SPC g g` | `magit-status` | Launch Magit Git status |
| `SPC g ]` / `SPC g [` | `diff-hl-next/previous-hunk` | Jump through git diff hunks |
| `SPC g u` | `diff-hl-revert-hunk` | Revert selected git hunk |
| `SPC B` | `berserk-splash-screen` | Return to The Brand splash screen |

---

## 🚀 Installation

```bash
# Backup existing config if present
mv ~/.emacs.d ~/.emacs.d.bak

# Clone repository
git clone https://github.com/SycamoreQ/sycamore-emacs.git ~/.emacs.d

# Launch Emacs (packages will automatically bootstrap on first run)
emacs
```

### Dependencies (Optional for preview and spellchecking)

```bash
# macOS via Homebrew
brew install pandoc aspell
```
