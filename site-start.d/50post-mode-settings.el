
;; Post Mode
;; Download http://sourceforge.net/p/post-mode/code/ci/master/tree/post.el?format=raw
;; and put in the autoload directory
;; mutt composition mode
(autoload 'post-mode "post" "mode for e-mail" t)
(add-to-list 'auto-mode-alist
	     '("\\.*mutt-*\\|.article\\|\\.followup"
	       . post-mode))
