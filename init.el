;;; private/mary/init.el -*- lexical-binding: t; -*-

;; (def-package-hook! rainbow-delimiters :disable)
;; (def-package-hook! solaire-mode :disable)
;; (def-package-hook! stripe-buffer :disable)

(setq-default server-auth-dir (concat doom-emacs-dir "server/"))

(when (string= system-type "windows-nt")
  (set-selection-coding-system 'utf-16-le))

;; No line numbers
(setq doom-line-numbers-style nil)

;; (setq doom-theme 'doom-molokai)
;; (setq doom-theme 'doom-nova)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-one-light)
;; (setq doom-theme 'doom-peacock)
(setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'doom-vibrant)

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
