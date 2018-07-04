;;; private/mary/config.el -*- lexical-binding: t; -*-

(load! "+bindings")

(defvar +mary-dir (file-name-directory load-file-name))

(setq-default server-auth-dir (concat doom-emacs-dir "server/"))

(when (string= system-type "windows-nt")
  (set-selection-coding-system 'utf-16-le))

;; No line numbers
(setq doom-line-numbers-style nil)

;; (setq doom-theme 'doom-challenger-deep)
;; (setq doom-theme 'doom-city-lights)
;; (setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-molokai)
;; (setq doom-theme 'doom-mono-dark)
;; (setq doom-theme 'doom-mono-light)
;; (setq doom-theme 'doom-nord)
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-nova)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-one-light)
(setq doom-theme 'doom-opera)
;; (setq doom-theme 'doom-opera-light)
;; (setq doom-theme 'doom-peacock)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-spacegrey)
;; (setq doom-theme 'doom-tomorrow-day)
;; (setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'doom-tron)
;; (setq doom-theme 'doom-vibrant)

(setq doom-font
      (font-spec :family "Iosevka Slab"
                 :size 12))
(setq doom-big-font
      (font-spec :family "Iosevka Slab"
                 :size 18))
(setq doom-variable-pitch-font
      (font-spec :family "Sarasa Gothic J"
                 :size 12))
(setq doom-unicode-font
      (font-spec :family "Sarasa Mono J"
                 :size 12))

(setq-default frame-title-format '("%b - Emacs"))
(setq +doom-dashboard-functions '(doom-dashboard-widget-shortmenu doom-dashboard-widget-loaded))

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
  (setq company-minimum-prefix-length 2
        company-selection-wrap-around t))

(after! rust-mode
  (when IS-WINDOWS
    (setq +rust-src-dir (concat (getenv "Home") "/.rustup/toolchains/nightly-x86_64-pc-windows-msvc/lib/rustlib/src/rust/src"))))

(after! magit
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

  (when IS-WINDOWS
    (setenv "SSH_ASKPASS" "git-gui--askpass")))

(def-package! projectile-ripgrep
  :after projectile)

(setq auto-window-vscroll nil)
(setq w32-pipe-read-delay 0)

(put 'narrow-to-region 'disabled nil)

(setq timer-max-repeats 1)
