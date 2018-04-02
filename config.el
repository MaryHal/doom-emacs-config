;;; private/mary/config.el -*- lexical-binding: t; -*-

(setq-default server-auth-dir (concat doom-emacs-dir "server/"))

(when (string= system-type "windows-nt")
  (set-selection-coding-system 'utf-16-le))

;; No line numbers
(setq doom-line-numbers-style nil)

;; (setq doom-theme 'doom-one) ;; doom-themes' flagship theme, inspired by Atom's One Dark themes
;; (setq doom-theme 'doom-one-light) ;; light version of doom-one (thanks to ztlevi)
;; (setq doom-theme 'doom-vibrant) ;; a slightly more vibrant version of doom-one
;; (setq doom-theme 'doom-city-lights) ;; (thanks to fuxialexander)
;; (setq doom-theme 'doom-darcula) ;; (thanks to fuxialexander)
;; (setq doom-theme 'doom-molokai) ;; based on Textmate's monokai
;; (setq doom-theme 'doom-nord) ;; (thanks to fuxialexander)
;; (setq doom-theme 'doom-nova) ;; adapted from Nova (thanks to bigardone)
;; (setq doom-theme 'doom-peacock) ;; based on Peacock from daylerees' themes (thanks to teesloane)
;; (setq doom-theme 'doom-solarized-light) ;; light variant of Solarized (thanks to fuxialexander)
;; (setq doom-theme 'doom-spacegrey) ;; I'm sure you've heard of it (thanks to teesloane)
(setq doom-theme 'doom-tomorrow-night) ;; by Chris Kempson
;; (setq doom-theme 'doom-tomorrow-day) ;; by Chris Kempson (thanks to emacswatcher)
;; (setq doom-theme 'doom-mono-dark) ;; a minimalistic, monochromatic theme
;; (setq doom-theme 'doom-mono-light) ;; a minimalistic, monochromatic theme
;; (setq doom-theme 'doom-tron) ;; based on Tron Legacy from daylerees' themes

(setq doom-font
      (font-spec :family "Iosevka Term Slab"
                 :size 12))
(setq doom-big-font
      (font-spec :family "Iosevka Term Slab"
                 :size 18))
(setq doom-variable-pitch-font
      (font-spec :family "Sarasa Gothic J"
                 :size 12))
(setq doom-unicode-font
      (font-spec :family "Sarasa Mono J"
                 :size 12))

(setq-default frame-title-format '("%b - Emacs"))
(setq +doom-dashboard-functions '(doom-dashboard-widget-shortmenu doom-dashboard-widget-loaded))

(when (featurep! :feature evil)
  (load! +bindings))

(defvar +mary-dir (file-name-directory load-file-name))
(defvar +mary-snippets-dir (expand-file-name "snippets/" +mary-dir))

(def-package! vdiff)

(after! doom-modeline
  ;; De-bold some icons in doom-modeline
  (set-face-attribute 'doom-modeline-info            nil :weight 'normal)
  (set-face-attribute 'doom-modeline-buffer-modified nil :weight 'normal)
  (set-face-attribute 'doom-modeline-warning         nil :weight 'normal)
  (set-face-attribute 'doom-modeline-urgent          nil :weight 'normal))

(after! ivy
  (setq ivy-count-format "  %d/%d ")
  (setq ivy-format-function 'ivy-format-function-arrow)
  (setq ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-cd-selected))

(after! flyspell
  (cond
   ((executable-find "hunspell")
    (setq-default ispell-program-name "hunspell")
    (setq-default ispell-local-dictionary "en_US")
    (setq-default ispell-local-dictionary-alist
                  ;; Please note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell
                  ;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries
                  '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
                    )))

   ((executable-find "aspell")
    (setq-default ispell-program-name "aspell")
    ;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
    (setq-default ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))

  ;; On windows, append .exe suffix
  (when (and (string= system-type "windows-nt")
             ispell-program-name
             (not (string-match-p ".exe$" ispell-program-name 0)))
    (setq-default ispell-program-name (concat ispell-program-name ".exe")))
  )

(after! all-the-icons
  (setq inhibit-compacting-font-caches t))

(after! company
  (setq company-idle-delay 0
        company-minimum-prefix-length 2
        company-show-numbers nil
        company-require-match 'never
        company-selection-wrap-around t))

;; ;; Don't use default snippets, use mine.
;; (after! yasnippet
;;   (setq yas-snippet-dirs
;;         (append (list '+mary-snippets-dir)
;;                 (delq 'yas-installed-snippets-dir yas-snippet-dirs))))

(after! magit
  (setq-default magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

  (when IS-WINDOWS
    (setenv "SSH_ASKPASS" "git-gui--askpass")))

(setq auto-window-vscroll nil)

(put 'narrow-to-region 'disabled nil)
