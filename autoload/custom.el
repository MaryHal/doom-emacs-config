;;; private/mary/autoload/custom.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +mary/eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

;;;###autoload
(defun +mary/create-scratch-buffer ()
  "Create a new scratch buffer to work in.  Could be named *scratch* -> *scratchX*."
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (lisp-interaction-mode)))

;;;###autoload
(defun +mary:term:open-terminal ()
  "Just open a terminal in the cwd using the $TERMINAL environment variable."
  (interactive)
  (cond
   (IS-LINUX (call-process-shell-command (getenv "TERMINAL") nil 0))
   (IS-WINDOWS (call-process-shell-command "start powershell.exe" nil 0))))
