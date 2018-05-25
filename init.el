;; Set a default variable for env variable
;; Do Here so that manual-packages can also use this if needs be
(setq local-dist "current") ; default
(if (equal (getenv "LOCAL_DIST") nil)
    nil
  (setq local-dist (getenv "LOCAL_DIST"))
  )

(setq local-install-dir "~/.local")
(if (equal (getenv "LOCAL_INSTALL_DIR") nil)
    nil
  (setq local-install-dir (getenv "LOCAL_INSTALL_DIR"))
  )

;; Initialize manual packages (including my-site-start)
(load "~/.emacs.d/manual-packages.el")

;; Load "modular emacs config" library
;; to load up everything in ~/.emacs.d/site-start.d
(autoload 'my-site-start "~/.emacs.d/manual-packages/my-site-start/my-site-start" nil t)
(my-site-start "~/.emacs.d/site-start.d/")

;; Variables set by 'customize'
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(xref-prompt-for-identifier
   (quote
    (not xref-find-definitions xref-find-definitions-other-window xref-find-definitions-other-frame xref-find-references))))
