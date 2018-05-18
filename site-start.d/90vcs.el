
;; Basic syntax highlighting modes
;; (use backend agnostic vc for normal stuff)

;; git
(use-package git-commit
  :config
  ;; git-commit mode wants to go into emacs state.  Force evil state.
  (add-hook 'with-editor-mode-hook 'evil-normal-state)
  )
(use-package gitconfig-mode)
(use-package gitignore-mode)
(use-package gitattributes-mode)

;; Mercurial
(use-package hgignore-mode)
(use-package hgrc-mode)
