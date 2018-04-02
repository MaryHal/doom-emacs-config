;;; private/mary/+bindings.el -*- lexical-binding: t; -*-

(map! :n  "K"      #'join-line
      (:after anzu
        "M-%"   #'anzu-query-replace
        "C-M-%" #'anzu-query-replace-regexp)

      :nv "+" #'evil-numbers/inc-at-pt
      :nv "-" #'evil-numbers/dec-at-pt

      ;; --- <leader> -------------------------------------
      (:leader
        (:desc "workspace" :prefix "TAB"
          :desc "New workspace"            :n "c"   #'+workspace/new
          :desc "Rename workspace"         :n "r"   #'+workspace/rename)

        (:desc "buffer" :prefix "b"
          :desc "List buffers"            :n "l" #'list-buffers)

        (:desc "open" :prefix "o"
          :desc "External Terminal" :n "e" #'+mary:term:open-terminal)

        (:desc "project" :prefix "p"
          :desc "Find file in project"    :n  "f" #'projectile-find-file
          :desc "Kill project buffers"    :n  "k" #'projectile-kill-buffers
          :desc "Switch project"          :n  "p" #'projectile-switch-project
          :desc "Recent project files"    :n  "r" #'projectile-recentf
          (:desc "Search project" :prefix "s"
            :desc "rg" :n "r" #'counsel-projectile-rg
            :desc "ag" :n "a" #'counsel-projectile-ag
            :desc "g"  :n "g" #'projectile-grep)
          )))

