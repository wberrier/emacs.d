
;; Post Mode
;; mutt composition mode

(add-to-list 'auto-mode-alist
	     '("\\.*mutt-*\\|.article\\|\\.followup"
	       . post-mode))
(require 'post)
