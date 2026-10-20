;;; init.el --- Berserk Emacs — The Black Swordsman Edition -*- lexical-binding: t -*-
;;
;;   ██████╗ ███████╗██████╗ ███████╗███████╗██████╗ ██╗  ██╗
;;   ██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗██║ ██╔╝
;;   ██████╔╝█████╗  ██████╔╝███████╗█████╗  ██████╔╝█████╔╝
;;   ██╔══██╗██╔══╝  ██╔══██╗╚════██║██╔══╝  ██╔══██╗██╔═██╗
;;   ██████╔╝███████╗██║  ██║███████║███████╗██║  ██║██║  ██╗
;;   ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝
;;
;; "Even if the morrow is barren of promises,
;;  nothing shall forestall my return."
;;
;; Two colors. No mercy. No gradients.
;; Black: #000000   Red: #FF0000
;;; ── Environment & PATH (macOS Homebrew support) ──────────────────────────────
(dolist (dir '("/opt/homebrew/bin" "/opt/homebrew/sbin" "/usr/local/bin"))
  (when (file-directory-p dir)
    (add-to-list 'exec-path dir)
    (setenv "PATH" (concat dir ":" (getenv "PATH")))))

;;; ── Bootstrap straight.el (package manager) ─────────────────────────────────
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;;; ── Core UI: kill all decorations ───────────────────────────────────────────
(setq inhibit-startup-screen t        ; we use our own splash
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

(when (fboundp 'menu-bar-mode)   (menu-bar-mode   -1))
(when (fboundp 'tool-bar-mode)   (tool-bar-mode   -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tooltip-mode)    (tooltip-mode    -1))
(when (fboundp 'blink-cursor-mode) (blink-cursor-mode 1))   ; blinking red cursor — the Brand marks you

;; Fringe: minimal, black
(when (fboundp 'fringe-mode) (fringe-mode '(4 . 0)))

;; Font — use a good monospace; fall back gracefully
(defun berserk--set-font ()
  "Set font to best available monospace."
  (cond
   ((find-font (font-spec :name "JetBrains Mono"))
    (set-frame-font "JetBrains Mono-13" nil t))
   ((find-font (font-spec :name "Fira Code"))
    (set-frame-font "Fira Code-13" nil t))
   ((find-font (font-spec :name "Cascadia Code"))
    (set-frame-font "Cascadia Code-13" nil t))
   ((find-font (font-spec :name "Hack"))
    (set-frame-font "Hack-13" nil t))
   (t
    (set-frame-font "Monospace-13" nil t))))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (f) (with-selected-frame f (berserk--set-font))))
  (berserk--set-font))

;;; ── Load the Berserk theme ───────────────────────────────────────────────────
(add-to-list 'custom-theme-load-path
             (expand-file-name "themes/" user-emacs-directory))

(load-theme 'berserk t)

;; Ensure terminal Emacs matches Ghostty's exact background seamlessly
(defun berserk--setup-terminal-faces (&optional frame)
  "Make Emacs default background match Ghostty seamlessly in terminal."
  (unless (display-graphic-p frame)
    (with-selected-frame (or frame (selected-frame))
      (set-face-background 'default "unspecified-bg")
      (set-face-background 'line-number "unspecified-bg")
      (set-face-background 'line-number-current-line "unspecified-bg"))))

(if (daemonp)
    (add-hook 'after-make-frame-functions #'berserk--setup-terminal-faces)
  (berserk--setup-terminal-faces))

;;; ── Splash screen ────────────────────────────────────────────────────────────
;; berserk-splash.el lives in lisp/ to avoid the load-path warning
(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))
(require 'berserk-splash)

;; Show our splash instead of the default
;; initial-buffer-choice needs a function that RETURNS a buffer.
;; berserk-splash-screen now returns the buffer object directly.
(setq initial-buffer-choice #'berserk-splash-screen)

;;; ── Line numbers ─────────────────────────────────────────────────────────────
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)   ; relative like vim — good for combat

;;; ── Current line highlight ───────────────────────────────────────────────────
(when (fboundp 'global-hl-line-mode) (global-hl-line-mode 1))

;;; ── Doom Modeline ────────────────────────────────────────────────────────────
;;; ── Mode line — built-in, no packages, no nerd-icons ───────────────────────
;; A clean hand-styled mode-line: red when active, black when inactive.
;; Format: [evil-state] buffer-name | position | major-mode
(setq-default mode-line-format
  '("%e"
    ;; Left side bar indicator (colored via faces)
    (:propertize " ⚔ " face mode-line-berserk-brand)
    ;; Buffer name
    (:propertize "%b" face mode-line-berserk-buffer)
    ;; Modified indicator
    (:propertize "%*" face mode-line-berserk-modified)
    "  "
    ;; Position
    (:propertize "L%l C%c" face mode-line-berserk-pos)
    "  "
    ;; Major mode
    (:propertize "%m" face mode-line-berserk-mode)
    ;; Right-pad
    " "))

;; Define the faces — active mode-line is red on black, inactive is dim
(make-face 'mode-line-berserk-brand)
(make-face 'mode-line-berserk-buffer)
(make-face 'mode-line-berserk-modified)
(make-face 'mode-line-berserk-pos)
(make-face 'mode-line-berserk-mode)

(custom-set-faces
 ;; Active mode-line: solid red background, black text
 '(mode-line           ((t (:background "#FF0000" :foreground "#000000"
                             :box nil :height 0.95))))
 ;; Inactive: black bg, dark red text
 '(mode-line-inactive  ((t (:background "#000000" :foreground "#440000"
                             :box nil :height 0.95))))
 ;; Brand glyph: bright on active, dimmer otherwise (inherits mode-line bg)
 '(mode-line-berserk-brand    ((t (:foreground "#000000" :weight bold))))
 '(mode-line-berserk-buffer   ((t (:foreground "#000000" :weight bold))))
 '(mode-line-berserk-modified ((t (:foreground "#000000" :weight bold))))
 '(mode-line-berserk-pos      ((t (:foreground "#1A0000"))))
 '(mode-line-berserk-mode     ((t (:foreground "#1A0000" :slant italic)))))

;;; ── Which-key (keybind popup) ────────────────────────────────────────────────
(use-package which-key
  :config
  (which-key-mode 1)
  (setq which-key-idle-delay 0.4
        which-key-separator " → "
        which-key-prefix-prefix "⚔ "))

;;; ── Vertico + Marginalia (minibuffer completion) ─────────────────────────────
(use-package vertico
  :init (vertico-mode 1))

(use-package marginalia
  :init (marginalia-mode 1))

(use-package orderless
  :config
  (setq completion-styles '(orderless basic)))

;;; ── Corfu (inline autocomplete) ─────────────────────────────────────────────
(use-package corfu
  :init (global-corfu-mode 1)
  :config
  (setq corfu-auto t
        corfu-quit-no-match t))

;;; ── Consult + Embark (round out the vertico/orderless stack) ────────────────
;; vertico/marginalia/orderless give you the completion UI; consult gives you
;; the commands worth running through it, and embark lets you act on a
;; candidate without leaving the minibuffer.
(use-package consult
  :bind (("C-s"   . consult-line)
         ("C-x b" . consult-buffer)))

(use-package embark
  :bind (("C-." . embark-act)))

(use-package embark-consult
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

;;; ── Evil mode (vim keybindings) — optional, comment out if unwanted ──────────
(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-undo-system 'undo-redo)
  :config
  (evil-mode 1)
  ;; Cursor: red block in normal, red bar in insert
  (setq evil-normal-state-cursor  '("#FF0000" box)
        evil-insert-state-cursor  '("#FF0000" bar)
        evil-visual-state-cursor  '("#FF0000" hollow)
        evil-emacs-state-cursor   '("#FF0000" bar)))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

;;; ── General.el (keybindings with SPC leader) ─────────────────────────────────
(use-package general
  :config
  (general-evil-setup t)
  (general-create-definer berserk-leader
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  (berserk-leader
    "."   '(find-file               :which-key "find file")
    ","   '(switch-to-buffer        :which-key "switch buffer")
    "k"   '(kill-buffer             :which-key "kill buffer")
    "q"   '(save-buffers-kill-emacs :which-key "quit")

    ;; Files
    "f"   '(:ignore t :which-key "⚔ files")
    "f f" '(find-file               :which-key "find file")
    "f s" '(save-buffer             :which-key "save")
    "f r" '(recentf-open-files      :which-key "recent")

    ;; Buffers
    "b"   '(:ignore t :which-key "⚔ buffers")
    "b b" '(switch-to-buffer        :which-key "switch")
    "b k" '(kill-current-buffer     :which-key "kill")
    "b n" '(next-buffer             :which-key "next")
    "b p" '(previous-buffer         :which-key "prev")

    ;; Windows
    "w"   '(:ignore t :which-key "⚔ windows")
    "w v" '(split-window-right      :which-key "split right")
    "w s" '(split-window-below      :which-key "split below")
    "w d" '(delete-window           :which-key "close")
    "w h" '(windmove-left           :which-key "← left")
    "w l" '(windmove-right          :which-key "right →")
    "w k" '(windmove-up             :which-key "↑ up")
    "w j" '(windmove-down           :which-key "↓ down")

    ;; Org — notes, agenda, capture
    "o"   '(:ignore t :which-key "⚔ org")
    "o a" '(org-agenda                 :which-key "agenda")
    "o c" '(org-capture                :which-key "capture")
    "o l" '(org-store-link             :which-key "store link")

    ;; Writing — markdown / blog
    "m"   '(:ignore t :which-key "⚔ write")
    "m n" '(berserk-new-blog-post          :which-key "new post")
    "m z" '(olivetti-mode                  :which-key "focus mode")
    "m s" '(berserk-blog-stats             :which-key "word/read stats")
    "m e" '(org-gfm-export-to-markdown     :which-key "org → gfm")

    ;; Preview options
    "m p"   '(:ignore t :which-key "⚔ preview")
    "m p p" '(markdown-preview-mode        :which-key "browser live preview")
    "m p e" '(markdown-live-preview-mode   :which-key "split eww live preview")
    "m p b" '(markdown-export-and-preview  :which-key "export & open browser")
    "m p g" '(grip-mode                    :which-key "grip live preview")

    ;; Code blocks
    "m c"   '(:ignore t :which-key "⚔ code blocks")
    "m c '" '(markdown-edit-code-block     :which-key "edit block in mode")
    "m c i" '(markdown-insert-gfm-code-block :which-key "insert fenced block")

    ;; Insert elements
    "m i"   '(:ignore t :which-key "⚔ insert")
    "m i l" '(markdown-insert-link         :which-key "link")
    "m i i" '(markdown-insert-image        :which-key "image")
    "m i c" '(markdown-insert-gfm-code-block :which-key "code block")
    "m i t" '(markdown-toc-generate-toc    :which-key "table of contents")
    "m i v" '(markdown-toggle-inline-images :which-key "toggle inline images")

    ;; Table of Contents
    "m t"   '(:ignore t :which-key "⚔ toc")
    "m t g" '(markdown-toc-generate-toc    :which-key "generate TOC")
    "m t r" '(markdown-toc-refresh-toc     :which-key "refresh TOC")

    ;; Git
    "g"   '(:ignore t :which-key "⚔ git")
    "g g" '(magit-status               :which-key "status")
    "g ]" '(diff-hl-next-hunk          :which-key "next hunk")
    "g [" '(diff-hl-previous-hunk      :which-key "prev hunk")
    "g u" '(diff-hl-revert-hunk        :which-key "revert hunk")

    ;; Search — consult on top of the vertico stack
    "s"   '(:ignore t :which-key "⚔ search")
    "s s" '(consult-line               :which-key "in buffer")
    "s b" '(consult-buffer             :which-key "buffer")
    "s r" '(consult-ripgrep            :which-key "ripgrep")

    ;; Jump — avy
    "j"   '(:ignore t :which-key "⚔ jump")
    "j j" '(avy-goto-char-timer        :which-key "to char")
    "j l" '(avy-goto-line              :which-key "to line")

    ;; Brand — open splash
    "B"   '(berserk-splash-screen   :which-key "⚔ The Brand")))

;;; ── Treemacs (file sidebar) ──────────────────────────────────────────────────
(use-package treemacs
  :config
  ;; Force black background on treemacs
  (set-face-attribute 'treemacs-root-face nil
                      :foreground "#FF0000" :weight 'bold)
  (set-face-attribute 'treemacs-directory-face nil
                      :foreground "#FF0000")
  (set-face-attribute 'treemacs-file-face nil
                      :foreground "#FFFFFF"))

(use-package treemacs-evil :after (treemacs evil))

;;; ── Rainbow delimiters — red parens ─────────────────────────────────────────
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  ;; All paren levels are red — darker as they go deeper
  (set-face-attribute 'rainbow-delimiters-depth-1-face  nil :foreground "#FF0000")
  (set-face-attribute 'rainbow-delimiters-depth-2-face  nil :foreground "#CC0000")
  (set-face-attribute 'rainbow-delimiters-depth-3-face  nil :foreground "#AA0000")
  (set-face-attribute 'rainbow-delimiters-depth-4-face  nil :foreground "#880000")
  (set-face-attribute 'rainbow-delimiters-depth-5-face  nil :foreground "#660000")
  (set-face-attribute 'rainbow-delimiters-depth-6-face  nil :foreground "#440000")
  (set-face-attribute 'rainbow-delimiters-depth-7-face  nil :foreground "#CC0000")
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      :foreground "#FFFFFF" :background "#FF0000"))

;;; ── Highlight matching parens ────────────────────────────────────────────────
(show-paren-mode 1)
(setq show-paren-delay 0)

;;; ── Org mode: notes, agenda, and blog drafting ───────────────────────────────
(defvar berserk-org-dir (expand-file-name "~/org/")
  "Where notes, tasks, and journal entries live. Adjust to taste.")
(defvar berserk-blog-dir (expand-file-name "~/blog/src/content/posts/")
  "Where finished posts land for the Astro site. Adjust to your repo layout.")

(use-package org
  :straight (:type built-in)          ; use Emacs's bundled org, don't shadow it
  :hook ((org-mode . org-indent-mode)
         (org-mode . visual-line-mode))
  :config
  (setq org-directory berserk-org-dir
        org-agenda-files (list berserk-org-dir)
        org-startup-folded 'content
        org-ellipsis " ▾"
        org-hide-emphasis-markers t   ; org-appear (below) reveals them near point
        org-log-done 'time
        org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "KILL(k)"))
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-confirm-babel-evaluate nil
        org-export-with-toc t
        org-export-with-section-numbers nil)

  ;; TODO state colors — red/black/gray, no mercy
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "#FF0000" :weight bold))
          ("NEXT" . (:foreground "#000000" :weight bold :background "#FF0000"))
          ("WAIT" . (:foreground "#880000" :weight bold))
          ("DONE" . (:foreground "#440000"))
          ("KILL" . (:foreground "#1A0000" :strike-through t))))

  ;; Capture templates — bound to SPC o c
  (setq org-capture-templates
        `(("t" "Task" entry (file+headline ,(expand-file-name "tasks.org" berserk-org-dir) "Inbox")
           "* TODO %?\n  %U\n  %a")
          ("j" "Journal" entry (file+datetree ,(expand-file-name "journal.org" berserk-org-dir))
           "* %U %?\n")
          ("b" "Blog idea" entry (file+headline ,(expand-file-name "blog-ideas.org" berserk-org-dir) "Ideas")
           "* %?\n  %U")))

  ;; Babel — flip on whatever languages you actually run through org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell      . t)
     (C          . t)
     (python     . t))))

;;; org-modern — cleaner bullets, tables, and tags, no old org-bullets fuss
(use-package org-modern
  :after org
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star '("◆" "◈" "◇" "•" "·")
        org-modern-table nil     ; keep org's native table alignment; org-modern's fights evil a bit
        org-modern-todo-faces org-todo-keyword-faces))

;;; org-appear — reveal *bold*/=code=/[[links]] markup only around point
(use-package org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autolinks t
        org-appear-autosubmarkers t))

;;; org-download — drag or paste images straight into notes and posts
(use-package org-download
  :after org
  :config
  (setq org-download-method 'directory
        org-download-image-dir "./images"
        org-download-heading-lvl nil))

;;; toc-org — auto-maintained table of contents, handy for long posts
(use-package toc-org
  :hook (org-mode . toc-org-mode))

;;; ox-gfm — export org straight to GitHub-flavored markdown, bound to SPC m e
(use-package ox-gfm
  :after org)

;;; ── Markdown mode: blogging ───────────────────────────────────────────────
(use-package markdown-mode
  :mode (("\\.md\\'"       . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :hook ((markdown-mode . visual-line-mode)
         (markdown-mode . (lambda ()
                            (when (or (executable-find "aspell")
                                      (executable-find "ispell"))
                              (flyspell-mode 1)))))
  :bind (:map markdown-mode-map
         ("C-c '" . markdown-edit-code-block))
  :config
  ;; Native font-locking / syntax highlighting for fenced code blocks
  (setq markdown-fontify-code-blocks-natively t
        markdown-fontify-whole-heading-line t
        markdown-header-scaling t
        markdown-asymmetric-header t
        markdown-enable-math t
        markdown-max-image-size '(800 . 600)
        markdown-split-window-direction 'right)

  ;; Configure pandoc for high-fidelity markdown export
  (if (executable-find "pandoc")
      (setq markdown-command "pandoc --standalone --mathjax --highlight-style=tango")
    (setq markdown-command "markdown"))

  ;; Map common programming languages to their Emacs major modes
  (setq markdown-code-lang-modes
        '(("javascript" . js-mode)
          ("js"         . js-mode)
          ("jsx"        . js-mode)
          ("typescript" . typescript-ts-mode)
          ("ts"         . typescript-ts-mode)
          ("tsx"        . tsx-ts-mode)
          ("json"       . js-json-mode)
          ("yaml"       . yaml-mode)
          ("yml"        . yaml-mode)
          ("python"     . python-mode)
          ("py"         . python-mode)
          ("bash"       . sh-mode)
          ("sh"         . sh-mode)
          ("zsh"        . sh-mode)
          ("shell"      . sh-mode)
          ("c"          . c-mode)
          ("cpp"        . c++-mode)
          ("c++"        . c++-mode)
          ("rust"       . rust-ts-mode)
          ("rs"         . rust-ts-mode)
          ("go"         . go-ts-mode)
          ("golang"     . go-ts-mode)
          ("html"       . html-mode)
          ("css"        . css-mode)
          ("sql"        . sql-mode)
          ("elisp"      . emacs-lisp-mode)
          ("emacs-lisp" . emacs-lisp-mode))))

;;; markdown-preview-mode — live websocket browser preview as you type
(use-package markdown-preview-mode
  :commands (markdown-preview-mode)
  :config
  (setq markdown-preview-auto-open t
        markdown-preview-delay-time 1.0))

;;; markdown-toc — auto-generated and updated table of contents
(use-package markdown-toc
  :commands (markdown-toc-generate-toc markdown-toc-refresh-toc))

;;; grip-mode — live GitHub-flavored preview in the browser
(use-package grip-mode
  :commands (grip-mode)
  :config
  (setq grip-preview-use-webkit nil))

;;; yaml-mode — Astro front matter, plus .yml/.yaml files generally
(use-package yaml-mode
  :mode ("\\.ya?ml\\'" . yaml-mode))

;;; Blog writing helpers
(defun berserk-blog-stats ()
  "Display word count and estimated reading time for the current blog post."
  (interactive)
  (let* ((words (count-words (point-min) (point-max)))
         (chars (- (point-max) (point-min)))
         (reading-time (max 1 (ceiling (/ (float words) 200.0)))))
    (message "⚔ Blog Stats: %d words | %d chars | ~%d min read"
             words chars reading-time)))

;;; A tiny helper to drop Astro front matter into a fresh post — SPC m n
(defun berserk-new-blog-post (title)
  "Create a new markdown post in `berserk-blog-dir' with Astro front matter."
  (interactive "sPost title: ")
  (unless (file-exists-p berserk-blog-dir)
    (make-directory berserk-blog-dir t))
  (let* ((slug (replace-regexp-in-string "[^a-z0-9]+" "-" (downcase title)))
         (file (expand-file-name (concat slug ".md") berserk-blog-dir)))
    (find-file file)
    (insert (format "---\ntitle: \"%s\"\npubDate: %s\ndescription: \"\"\n---\n\n"
                     title (format-time-string "%Y-%m-%d")))
    (goto-char (point-max))))

;;; ── Olivetti — centered column for distraction-free prose ───────────────────
(use-package olivetti
  :config (setq olivetti-body-width 90))

;;; ── Magit — a systems programmer without git porcelain is a crime ───────────
(use-package magit
  :commands (magit-status))
;; No extra glue needed — evil-collection-init (already called above) wires up
;; evil keybindings for magit's status/log/diff buffers automatically.

;;; ── diff-hl — git change markers in the fringe ───────────────────────────────
(use-package diff-hl
  :init (global-diff-hl-mode 1))

;;; ── Avy — jump to any visible char or line in a keystroke or two ────────────
(use-package avy
  :config (setq avy-background t))

;;; ── Miscellaneous quality-of-life ────────────────────────────────────────────
(setq-default
 indent-tabs-mode nil
 tab-width 4
 fill-column 80)

(setq
 auto-save-default nil
 make-backup-files nil
 ring-bell-function 'ignore     ; silence — like the void
 scroll-margin 5
 scroll-conservatively 101
 fast-but-imprecise-scrolling t)

(delete-selection-mode 1)
(electric-pair-mode 1)
(recentf-mode 1)
(savehist-mode 1)

;;; ── Custom set-variables (do not edit manually below this line) ──────────────
(custom-set-variables
 '(custom-enabled-themes '(berserk))
 '(custom-safe-themes t)
 '(column-number-mode t))

;;; init.el ends here