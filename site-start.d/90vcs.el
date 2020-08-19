
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

;; 26.2 adds some background colors to annotate, making it really hard
;; to see when running in a terminal with the "ample" color theme
;; disable it
;; TODO: maybe it looks better in the gui version?  Not sure...
;; also, it seems off by default?  Not sure how it gets enabled,
;; just disable here...
(use-package vc-annotate
  :ensure nil
  :custom
  (vc-annotate-background-mode nil)
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
  :load-path "~/.emacs.d/manual-packages/mercurial"
  :ensure nil ;; manual package, don't attempt to download
  )

;; diff stat mode
(use-package diffstat
  :load-path "~/.emacs.d/manual-packages/diffstat"
  :ensure nil ;; manual package
  ;; add keybinding
  )

;; nice interface for browsing git history?
;; we'll have to compare this with vc-annotate and magit-blame
(use-package git-timemachine)

;; magit
;; previously I used vc-mode because it's backend agnostic
;; but, not that bitbucket (and me) abandoned Mercurial, it's probably
;; better to just dive in
(use-package magit)

;; it has a (require 'git), causing an error :/
;; ;; like quilt on top of git
;; (use-package stgit)
