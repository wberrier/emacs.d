
(use-package vc-hooks
  :ensure nil
  :custom
  ;; Turned on allows doing vc operations on symlinks, which is nice
  ;; TODO: is there a case where having this off is really slow?
  ;; (I can't remember why I originally disabled this)
  (vc-follow-symlinks t)
  ;; this makes loading/saving of files slow if it has to do git/hg status
  ;;(vc-handled-backends ())
  )

;; Basic syntax highlighting modes
;; (use backend agnostic vc for normal stuff)

;; git
(use-package git-commit
  :init
  ;; git-commit mode wants to go into emacs state.  Force evil state.
  (add-hook 'with-editor-mode-hook 'evil-normal-state)
  )
(use-package gitconfig-mode)
(use-package gitignore-mode)
(use-package gitattributes-mode)

;; Mercurial
(use-package hgignore-mode)
(use-package hgrc-mode)

;; TODO: disable for now since this really slows things down when loading/saving files?
(use-package mercurial
  :ensure nil ;; manual package, don't attempt to download
  )

;; diff stat mode
(use-package diffstat
  :ensure nil ;; manual package
  ;; add keybinding
)
