(progn
  (when (and (boundp 'user-init-file) user-init-file)
    (error "Run this in emacs -Q, please!"))

  (setq
   user-init-file (buffer-file-name)
   user-emacs-directory (file-name-directory user-init-file)
   straight-recipe-overrides '((nil (straight :type git :host github :repo "antifuchs/straight.el" :files ("straight*.el") :branch "no-decapitate"))))

  (let ((bootstrap-file
         (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
        (bootstrap-version 4))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el")
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))
  (straight-use-package 'emacsmirror) ; somehow I can't freeze versions when I leave this out.
  (straight-use-package 'ace-window))

;; Next step: M-x straight-freeze-versions RET, then =git diff= to validate that ace-window's frozen version has changed.
