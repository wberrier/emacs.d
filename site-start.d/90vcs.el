;; don't really use this...
;; (require 'git-rebase-mode) ;; doesn't work well with evil

(require 'magit)
(require 'evil-magit)

;; avoid some startup warnings
;(setq magit-last-seen-setup-instructions "1.4.0")

(require 'git-commit)
(require 'gitconfig-mode)
(require 'gitignore-mode)
(require 'gitattributes-mode)

;; Mercurial Stuff
(require 'hgignore-mode)
(require 'hgrc-mode)

;; TODO: git's built-in backend agnostic system?
;; it's just that magit is so good...

