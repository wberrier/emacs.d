;; Set a default variable for env variable
;; Do Here so that manual-packages can also use this if needs be

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

;; Write out to this file so this file isn't constantly modified
(setq custom-file "~/.emacs.d/custom.el")

;; Don't need to load it for now since most customizations are set
;; using "use-package"
;;(load custom-file :noerror)
