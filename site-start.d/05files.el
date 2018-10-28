;; Backup options
(use-package files
  :ensure nil
  :init
  ;; create the backup directory if it doesn't exist
  (if (file-exists-p "~/backup/emacs")
	  nil
	(make-directory "~/backup/emacs" t)
	)

  :custom
  (backup-directory-alist '(("." . "~/backup/emacs")))
  (backup-by-copying t) ; don't clobber symlinks
  (delete-old-versions t)
  (kept-new-versions 6)
  (kept-old-versions 2)
  (version-control t)
  ;; Disable autosave
  (auto-save-default nil)
  ;; more like vim
  (require-final-newline t)
 )

;; Save place in files when visiting
(use-package saveplace
  :init
  (setq-default save-place t) ;; 24.5 and older
  :custom
  (save-place-file "~/.emacs.d/saved-places")
  :config
  ;; for 25.1 and newer
  (if (not (version< emacs-version "25.1"))
	  (save-place-mode 1)
	)
  )

