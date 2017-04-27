
; TODO: auto detect indent mode?
;; 4 space tabs for python
;(add-hook 'python-mode-hook
;	  (lambda ()
;	    (setq python-indent 4)
;	  )
;)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
