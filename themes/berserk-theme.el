;;; berserk-theme.el --- The Black Swordsman Edition -*- lexical-binding: t -*-
;;
;; "Even if the morrow is barren of promises,
;;  nothing shall forestall my return."
;;
;; A theme of pure black and blood red.
;; No mercy. No gradients. No tinted grays.

(deftheme berserk "The Brand of Sacrifice — pure black and red.")

(let* (;; ── Core palette ─────────────────────────────────────
       (bg          "#000000")   ; absolute black
       (bg-alt      "#0A0000")   ; editor pane bg (just barely off)
       (bg-hl       "#1A0000")   ; current line highlight
       (bg-region   "#3D0000")   ; selection
       (fg          "#FFFFFF")   ; primary text — white on black
       (fg-dim      "#888888")   ; comments, line numbers, dimmed
       (red         "#FF0000")   ; blood red — the Brand
       (red-dim     "#CC0000")   ; slightly dimmer red for strings
       (red-dark    "#880000")   ; dark red for less important things
       (border      "#FF0000")   ; red borders
       (border-dark "#330000")   ; subtle borders
       (cursor      "#FF0000"))  ; cursor is the Brand

  (custom-theme-set-faces
   'berserk

   ;; ── Fundamentals ──────────────────────────────────────────
   `(default                    ((t (:background ,bg :foreground ,fg))))
   `(cursor                     ((t (:background ,cursor))))
   `(region                     ((t (:background ,bg-region))))
   `(highlight                  ((t (:background ,bg-hl))))
   `(hl-line                    ((t (:background ,bg-hl))))
   `(fringe                     ((t (:background ,bg :foreground ,red-dark))))
   `(vertical-border            ((t (:foreground ,border-dark))))
   `(minibuffer-prompt          ((t (:foreground ,red :weight bold))))
   `(secondary-selection        ((t (:background ,bg-region))))
   `(trailing-whitespace        ((t (:background ,red))))
   `(escape-glyph               ((t (:foreground ,red))))

   ;; ── Line numbers ──────────────────────────────────────────
   `(line-number                ((t (:background ,bg :foreground ,red-dark))))
   `(line-number-current-line   ((t (:background ,bg-hl :foreground ,red :weight bold))))

   ;; ── Font lock (VS Code Dark+ syntax palette) ───────────────
   ;; Keywords: blue (#569CD6)
   `(font-lock-keyword-face          ((t (:foreground "#569CD6" :weight bold))))
   ;; Builtins & types: teal/mint (#4EC9B0)
   `(font-lock-builtin-face          ((t (:foreground "#4EC9B0"))))
   `(font-lock-type-face             ((t (:foreground "#4EC9B0" :weight bold))))
   ;; Function definitions & calls: warm yellow (#DCDCAA)
   `(font-lock-function-name-face    ((t (:foreground "#DCDCAA" :weight bold))))
   ;; Variables & parameters: light sky blue (#9CDCFE)
   `(font-lock-variable-name-face    ((t (:foreground "#9CDCFE"))))
   `(font-lock-property-name-face    ((t (:foreground "#9CDCFE"))))
   `(font-lock-property-use-face     ((t (:foreground "#9CDCFE"))))
   ;; Constants, booleans & enums: bright cyan (#4FC1FF)
   `(font-lock-constant-face         ((t (:foreground "#4FC1FF"))))
   ;; Strings: warm terracotta orange (#CE9178)
   `(font-lock-string-face           ((t (:foreground "#CE9178"))))
   ;; Numbers: soft sage green (#B5CEA8)
   `(font-lock-number-face           ((t (:foreground "#B5CEA8"))))
   ;; Comments & docstrings: muted green (#6A9955)
   `(font-lock-comment-face          ((t (:foreground "#6A9955" :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground "#6A9955"))))
   `(font-lock-doc-face              ((t (:foreground "#6A9955" :slant italic))))
   ;; Preprocessor & macros: control purple (#C586C0)
   `(font-lock-preprocessor-face     ((t (:foreground "#C586C0" :weight bold))))
   ;; Operators & delimiters: light neutral gray (#D4D4D4)
   `(font-lock-operator-face         ((t (:foreground "#D4D4D4"))))
   `(font-lock-bracket-face          ((t (:foreground "#D4D4D4"))))
   `(font-lock-delimiter-face        ((t (:foreground "#D4D4D4"))))
   ;; Escape characters & regex: khaki amber (#D7BA7D)
   `(font-lock-escape-face           ((t (:foreground "#D7BA7D"))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground "#D7BA7D"))))
   `(font-lock-regexp-grouping-construct ((t (:foreground "#D7BA7D"))))
   ;; Warnings & negation
   `(font-lock-warning-face          ((t (:foreground "#F44747" :weight bold :underline t))))
   `(font-lock-negation-char-face    ((t (:foreground "#569CD6" :weight bold))))

   ;; ── Mode line ─────────────────────────────────────────────
   `(mode-line           ((t (:background ,red :foreground ,bg
                               :box (:line-width 1 :color ,red)
                               :weight bold))))
   `(mode-line-inactive  ((t (:background ,bg :foreground ,red-dark
                               :box (:line-width 1 :color ,border-dark)))))
   `(mode-line-buffer-id ((t (:foreground ,bg :weight bold))))
   `(mode-line-highlight ((t (:box (:line-width 1 :color ,fg)))))

   ;; ── Search & isearch ──────────────────────────────────────
   `(isearch           ((t (:background ,red :foreground ,bg :weight bold))))
   `(isearch-fail      ((t (:background ,bg :foreground ,red-dark :underline t))))
   `(lazy-highlight    ((t (:background ,bg-region :foreground ,fg))))
   `(match             ((t (:background ,bg-region :foreground ,red :weight bold))))

   ;; ── Links ─────────────────────────────────────────────────
   `(link               ((t (:foreground ,red :underline t))))
   `(link-visited       ((t (:foreground ,red-dark :underline t))))
   `(button             ((t (:foreground ,red :underline t))))

   ;; ── Dired ─────────────────────────────────────────────────
   `(dired-directory  ((t (:foreground ,red :weight bold))))
   `(dired-flagged    ((t (:foreground ,red :weight bold))))
   `(dired-header     ((t (:foreground ,red :weight bold :underline t))))
   `(dired-marked     ((t (:foreground ,fg :weight bold))))
   `(dired-symlink    ((t (:foreground ,fg-dim :slant italic))))

   ;; ── Org mode ──────────────────────────────────────────────
   `(org-level-1      ((t (:foreground ,red   :weight bold :height 1.3))))
   `(org-level-2      ((t (:foreground ,fg    :weight bold :height 1.15))))
   `(org-level-3      ((t (:foreground ,red-dim             :height 1.05))))
   `(org-level-4      ((t (:foreground ,fg-dim))))
   `(org-todo         ((t (:foreground ,red   :weight bold))))
   `(org-done         ((t (:foreground ,fg-dim :weight bold))))
   `(org-date         ((t (:foreground ,red-dim :underline t))))
   `(org-block        ((t (:background ,bg-alt))))
   `(org-block-begin-line ((t (:foreground ,red-dark :background ,bg-alt))))
   `(org-block-end-line   ((t (:foreground ,red-dark :background ,bg-alt))))
   `(org-link         ((t (:foreground ,red :underline t))))
   `(org-document-title ((t (:foreground ,red :weight bold :height 1.5))))

   ;; ── Markdown mode & blogging ──────────────────────────────
   `(markdown-header-face-1      ((t (:foreground ,red :weight bold :height 1.35))))
   `(markdown-header-face-2      ((t (:foreground ,fg  :weight bold :height 1.2))))
   `(markdown-header-face-3      ((t (:foreground ,red-dim :weight bold :height 1.1))))
   `(markdown-header-face-4      ((t (:foreground ,fg-dim :weight bold))))
   `(markdown-header-face-5      ((t (:foreground ,red-dark))))
   `(markdown-header-face-6      ((t (:foreground ,fg-dim :slant italic))))
   `(markdown-code-face          ((t (:background "#141414" :foreground "#D4D4D4" :extend t))))
   `(markdown-pre-face           ((t (:background "#141414" :foreground "#D4D4D4" :extend t))))
   `(markdown-inline-code-face   ((t (:background "#1A1A1A" :foreground "#CE9178" :weight bold))))
   `(markdown-language-keyword-face ((t (:foreground "#569CD6" :weight bold))))
   `(markdown-language-info-face ((t (:foreground "#9CDCFE" :slant italic))))
   `(markdown-bold-face          ((t (:foreground ,fg :weight bold))))
   `(markdown-italic-face        ((t (:slant italic))))
   `(markdown-strike-through-face ((t (:strike-through t :foreground ,fg-dim))))
   `(markdown-blockquote-face    ((t (:foreground "#6A9955" :slant italic))))
   `(markdown-list-face          ((t (:foreground ,red :weight bold))))
   `(markdown-link-face          ((t (:foreground "#4FC1FF" :underline t))))
   `(markdown-url-face           ((t (:foreground "#569CD6" :underline t))))

   `(markdown-footnote-marker-face ((t (:foreground ,red-dim))))
   `(markdown-table-face         ((t (:foreground ,fg))))
   `(markdown-hr-face            ((t (:foreground ,red-dark :weight bold))))
   `(markdown-metadata-key-face  ((t (:foreground ,red :weight bold))))
   `(markdown-metadata-value-face ((t (:foreground ,red-dim))))
   `(markdown-gfm-checkbox-face  ((t (:foreground ,red :weight bold))))


   ;; ── Company (autocomplete) ────────────────────────────────
   `(company-tooltip            ((t (:background ,bg-alt :foreground ,fg))))
   `(company-tooltip-selection  ((t (:background ,bg-region :foreground ,fg))))
   `(company-tooltip-common     ((t (:foreground ,red :weight bold))))
   `(company-scrollbar-bg       ((t (:background ,bg-alt))))
   `(company-scrollbar-fg       ((t (:background ,red))))
   `(company-preview-common     ((t (:foreground ,fg-dim))))

   ;; ── Ivy / Vertico / Minibuffer completion ─────────────────
   `(ivy-current-match          ((t (:background ,bg-region :foreground ,fg :weight bold))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,red :weight bold))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,red :weight bold :underline t))))
   `(vertico-current            ((t (:background ,bg-region :foreground ,fg :weight bold))))

   ;; ── Magit ─────────────────────────────────────────────────
   `(magit-branch-local         ((t (:foreground ,red :weight bold))))
   `(magit-branch-remote        ((t (:foreground ,red-dim :weight bold))))
   `(magit-diff-added           ((t (:background "#001100" :foreground "#00CC00"))))
   `(magit-diff-removed         ((t (:background "#110000" :foreground ,red))))
   `(magit-diff-hunk-heading    ((t (:background ,bg-hl :foreground ,fg-dim))))
   `(magit-section-heading      ((t (:foreground ,red :weight bold))))
   `(magit-hash                 ((t (:foreground ,fg-dim))))

   ;; ── Whitespace / fill-column ──────────────────────────────
   `(whitespace-space       ((t (:foreground ,border-dark))))
   `(whitespace-newline     ((t (:foreground ,border-dark))))
   `(fill-column-indicator  ((t (:foreground ,border-dark))))

   ;; ── Error / warning faces ─────────────────────────────────
   `(error   ((t (:foreground ,red :weight bold))))
   `(warning ((t (:foreground ,red-dim :weight bold))))
   `(success ((t (:foreground ,fg :weight bold))))

   ;; ── Parenthesis matching ──────────────────────────────────
   `(show-paren-match    ((t (:background ,bg-region :foreground ,red :weight bold :box (:line-width 1 :color ,red)))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,bg :weight bold))))

   ;; ── Tab bar ───────────────────────────────────────────────
   `(tab-bar                  ((t (:background ,bg :foreground ,fg-dim))))
   `(tab-bar-tab              ((t (:background ,bg-hl :foreground ,red :weight bold
                                   :box (:line-width 1 :color ,red)))))
   `(tab-bar-tab-inactive     ((t (:background ,bg :foreground ,fg-dim
                                   :box (:line-width 1 :color ,border-dark)))))

   ;; ── Doom modeline (if used) ───────────────────────────────
   `(doom-modeline-bar          ((t (:background ,red))))
   `(doom-modeline-buffer-file  ((t (:foreground ,fg :weight bold))))
   `(doom-modeline-buffer-modified ((t (:foreground ,red :weight bold))))
   `(doom-modeline-project-dir  ((t (:foreground ,red-dim))))

   ;; ── Which-key ─────────────────────────────────────────────
   `(which-key-key-face         ((t (:foreground ,red :weight bold))))
   `(which-key-command-face     ((t (:foreground ,fg))))
   `(which-key-separator-face   ((t (:foreground ,fg-dim))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'berserk)
;;; berserk-theme.el ends here
