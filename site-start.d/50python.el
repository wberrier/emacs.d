
; TODO: auto detect indent mode?
;; 4 space tabs for python
;(add-hook 'python-mode-hook
;	  (lambda ()
;	    (setq python-indent 4)
;	  )
;)
					;)
(use-package lsp-python
  :after (lsp-mode)
  :init (add-hook 'python-mode-hook #'lsp-python-enable)
  )

