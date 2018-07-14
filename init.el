(progn
  (setq
   user-init-file (buffer-file-name)
   user-emacs-directory "~/Mess/current/straight-repro")

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
