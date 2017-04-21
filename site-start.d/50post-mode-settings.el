
;; Post Mode
;; mutt composition mode

(add-to-list 'auto-mode-alist '("tmp/mutt*\\|\\.article|\\.followup" . post-mode))
(add-to-list 'auto-mode-alist '("/tmp/evo*" . post-mode))

(require 'post)
