;;; private/mary/config.el -*- lexical-binding: t; -*-

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
  (setq-default magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(setq auto-window-vscroll nil)

(put 'narrow-to-region 'disabled nil)
