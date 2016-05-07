
;; Post Mode
;; mutt composition mode

(add-to-list 'load-path "~/wa/git/post-mode-code")

(autoload 'post-mode "post" "mode for e-mail" t)
(add-to-list 'auto-mode-alist
	     '("\\.*mutt-*\\|.article\\|\\.followup"
	       . post-mode))
