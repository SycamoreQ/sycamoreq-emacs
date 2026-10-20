;;; berserk-splash.el --- The Brand of Sacrifice splash screen -*- lexical-binding: t -*-

(defvar berserk-splash-brand
  '(
    "                    ⠣⣧                      "
    "                  ⡀ ⢰⣿  ⡠                   "
    "           ⣤⠂     ⠙⣷⣾⣿⣷⡿⠁    ⠘⢦⡀            "
    "        ⢀⣴⡿⠁       ⠈⣿⣿⣿⠁      ⠈⠻⣶⣄          "
    "      ⢀⣴⣿⠟          ⣿⣿⣿         ⠙⣿⣷⣄        "
    "    ⢀⣴⣿⣿⠏           ⣿⣿⣿          ⠈⢻⣿⣿⣤⡀     "
    "  ⢀⣴⣿⣿⣿⠋            ⣿⣿⣿            ⠹⣿⣿⣿⣦⡀   "
    "⢀⣴⣿⣿⣿⣿⠁             ⣿⣿⣿⠂            ⣘⣿⣿⣿⣿⡧  "
    " ⠙⠿⣿⣿⣿⣷⣄⡀           ⣿⣿⣿⠅          ⣠⣾⣿⣿⣿⡿⠋   "
    "   ⠉⠻⣿⣿⣿⣿⣦⡀         ⣿⣿⣿⠅        ⣤⣾⣿⣿⣿⡟⠃     "
    "     ⠈⠻⢿⣿⣿⣿⣦⣄       ⣽⣿⣿⡃     ⢀⣰⣾⣿⣿⣿⠟⠃       "
    "       ⠈⠙⢿⣿⣿⣿⣷⣤     ⢽⣿⣿⡇   ⢀⣴⣾⣿⣿⣿⠟⠉         "
    "          ⠙⠿⣿⣿⣿⣿⣦⡀  ⢽⣿⣿⡇ ⢀⣴⣿⣿⣿⣿⠟⠁           "
    "            ⠉⠻⣿⣿⣿⣿⣷⣄⣽⣿⣿⣇⣴⣿⣿⣿⡿⠏⠁             "
    "              ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⠁               "
    "                 ⠛⢿⣿⣿⣿⣿⣿⣿⣿⡏⠁                "
    "                ⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡄               "
    "              ⢠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄              "
    "            ⣠⣼⣿⣿⣿⣿⣿⠟⢻⣿⣿⣿⠛⢿⣿⣿⣿⣿⣷⣄            "
    "          ⣠⣾⣿⣿⣿⣿⣿⠟⠁ ⢸⣿⣿⣿  ⠙⢿⣿⣿⣿⣿⣷⣤          "
    "        ⣠⣾⣿⣿⣿⣿⡿⠏⠁   ⢸⣿⣿⣿    ⠘⠻⣿⣿⣿⣿⣿⣤⡀       "
    "      ⣠⣾⣿⣿⣿⣿⡿⠋      ⢸⣿⣿⣿      ⠈⠻⢿⣿⣿⣿⣿⣦⡀     "
    "    ⣠⣾⣿⣿⣿⣿⡿⠋        ⢘⣿⣿⣿        ⠈⠙⢿⣿⣿⣿⣿⣦⡄   "
    " ⢀⣠⣾⣿⣿⣿⣿⡿⠋          ⢨⣿⣿⣿           ⠙⠻⣿⣿⣿⣿⣷⣄ "
    "⣴⣾⣿⣿⣿⣿⡟⠁            ⢐⣿⣿⣿             ⣸⣿⣿⣿⣿⣿⡷"
    "⠙⢻⣿⣿⣿⣿⣷⣄            ⠐⣿⣿⣿           ⢀⣶⣿⣿⣿⣿⡿⠋ "
    "  ⠘⢻⣿⣿⣿⣿⣷⣄          ⠐⣿⣿⣿⡀        ⢀⣴⣿⣿⣿⣿⣿⠏⠁  "
    "    ⠈⠻⣿⣿⣿⣿⣷⣄         ⣿⣿⣿⡀       ⣤⣿⣿⣿⣿⣿⠟⠁    "
    "      ⠈⠻⣿⣿⣿⣿⣷⣆       ⣿⣿⣿⡂     ⣠⣾⣿⣿⣿⣿⠟⠁      "
    "        ⠈⠻⣿⣿⣿⣿⣿⣤⡀    ⣿⣿⣿⠆   ⢀⣼⣿⣿⣿⣿⡿⠋        "
    "          ⠈⠻⣿⣿⣿⣿⣿⣦⡀  ⣿⣿⣿⡇ ⢀⣴⣿⣿⣿⣿⡿⠋          "
    "            ⠈⠻⣿⣿⣿⣿⣿⣦⣀⣿⣿⣿⡇⣠⣾⣿⣿⣿⣿⠛            "
    "              ⠈⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁             "
    "                 ⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁               "
    "                  ⠈⠙⢿⣿⣿⣿⣿⡿⠋                 "
    "                     ⠙⢿⡿⠋                   "
  )
  "Brand of Sacrifice — braille art, taken directly from the Berserk symbol.")

(defvar berserk-splash-title
  '(
    "  ██████╗ ███████╗██████╗ ███████╗███████╗██████╗ ██╗  ██╗  "
    "  ██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗██║ ██╔╝  "
    "  ██████╔╝█████╗  ██████╔╝███████╗█████╗  ██████╔╝█████╔╝   "
    "  ██╔══██╗██╔══╝  ██╔══██╗╚════██║██╔══╝  ██╔══██╗██╔═██╗   "
    "  ██████╔╝███████╗██║  ██║███████║███████╗██║  ██║██║  ██╗  "
    "  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ "
  )
  "BERSERK title in block letters.")

(defvar berserk-splash-subtitle "The Black Swordsman Edition  ·  GNU Emacs")

(defvar berserk-splash-quotes
  '("\"Even if the morrow is barren of promises, nothing shall forestall my return.\""
    "\"I exist to fight. I merely forgot that for a moment.\""
    "\"In this world, is the destiny of mankind controlled by some transcendental entity or law?\""
    "\"Struggle for survival in a place where it doesn't belong... That is what it is to be human.\""
    "\"When you meet your God, tell him to leave me alone.\""
    "\"I don't care if you reject me. I won't accept a future without you in it.\""))

;;; ── Centering ────────────────────────────────────────────────────────────────

(defun berserk-splash--center (str width)
  "Pad STR with spaces so it is centered within WIDTH columns."
  (let* ((len (string-width str))
         (pad (max 0 (/ (- width len) 2))))
    (concat (make-string pad ?\s) str)))

(defun berserk-splash--win-w ()
  (cond ((window-live-p (selected-window)) (window-total-width))
        ((frame-live-p  (selected-frame))  (frame-width))
        (t 80)))

(defun berserk-splash--win-h ()
  (cond ((window-live-p (selected-window)) (window-total-height))
        ((frame-live-p  (selected-frame))  (frame-height))
        (t 40)))

;;; ── Insert ───────────────────────────────────────────────────────────────────

(defun berserk-splash-insert ()
  "Write the splash into the current buffer, dynamically centered."
  (let* ((w  (berserk-splash--win-w))
         (h  (berserk-splash--win-h))
         ;; rows: 36 brand + 1 gap + 6 title + 1 gap +
         ;;       1 subtitle + 1 blank + 1 sep + 1 blank +
         ;;       1 quote + 1 blank + 1 hints = 51
         (content-h 51)
         (top-pad (max 0 (/ (- h content-h) 2)))
         (RED    '(:foreground "#FF0000" :weight bold))
         (DIM    '(:foreground "#440000"))
         (GRAY   '(:foreground "#888888"))
         (QUOTE  '(:foreground "#CC0000" :slant italic))
         (chosen (nth (random (length berserk-splash-quotes))
                      berserk-splash-quotes)))

    (dotimes (_ top-pad) (insert "\n"))

    ;; Brand of Sacrifice
    (dolist (line berserk-splash-brand)
      (insert (propertize (berserk-splash--center line w) 'face RED))
      (insert "\n"))

    (insert "\n")

    ;; BERSERK title
    (dolist (line berserk-splash-title)
      (insert (propertize (berserk-splash--center line w) 'face RED))
      (insert "\n"))

    (insert "\n")

    ;; Subtitle
    (insert (propertize (berserk-splash--center berserk-splash-subtitle w) 'face GRAY))
    (insert "\n\n")

    ;; Separator
    (insert (propertize (berserk-splash--center (make-string 44 ?─) w) 'face DIM))
    (insert "\n\n")

    ;; Quote
    (insert (propertize (berserk-splash--center chosen w) 'face QUOTE))
    (insert "\n\n")

    ;; Hints
    (insert (propertize
             (berserk-splash--center
              "SPC f f  open file     SPC ,  switch buffer     SPC B  Brand" w)
             'face DIM))
    (insert "\n")))

;;; ── Show / refresh ───────────────────────────────────────────────────────────

(defun berserk-splash-screen ()
  "Show the Berserk splash screen. Returns the buffer (required by initial-buffer-choice)."
  (interactive)
  (let ((buf (get-buffer-create "*Berserk*")))
    (with-current-buffer buf
      (let ((inhibit-read-only t))
        (erase-buffer)
        (berserk-splash-insert)
        (goto-char (point-min))
        (setq-local cursor-type nil)
        (setq-local mode-line-format nil)
        (setq-local display-line-numbers nil)
        (setq-local global-hl-line-mode nil)
        (when (bound-and-true-p hl-line-mode)
          (hl-line-mode -1))
        (read-only-mode 1)))
    buf))

(defun berserk-splash--recenter (&rest _)
  "Re-render splash on window resize."
  (when (and (get-buffer "*Berserk*")
             (eq (current-buffer) (get-buffer "*Berserk*")))
    (let ((inhibit-read-only t))
      (erase-buffer)
      (berserk-splash-insert)
      (goto-char (point-min))
      (setq-local cursor-type nil)
      (setq-local display-line-numbers nil)
      (setq-local global-hl-line-mode nil)
      (when (bound-and-true-p hl-line-mode)
        (hl-line-mode -1)))))

(add-hook 'window-size-change-functions #'berserk-splash--recenter)

(provide 'berserk-splash)
;;; berserk-splash.el ends here
