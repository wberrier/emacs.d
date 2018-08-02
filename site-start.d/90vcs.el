
;; Basic syntax highlighting modes
;; (use backend agnostic vc for normal stuff)

;; HACK: I use vc instead of magit (since it supports multiple
;; backends) but because of magit issue #3536, I must also install
;; magit for git-commit to work
;; This can be removed once the fix from 3536 makes it into melpa
(use-package magit
  :config
  ;; Don't run magit-diff before going into commit mode
  (remove-hook 'server-switch-hook 'magit-commit-diff)
  )

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

;; TODO: any way to use use-package to do this?
;; TODO: disable for now since this really slows things down when loading/saving files?
(require 'mercurial)
