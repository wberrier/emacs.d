;; Set a default variable for env variable
;; Do Here so that manual-packages can also use this if needs be
(setq local-install-dir "~/install/current") ; default
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
