
; TODO: auto detect indent mode?
;; 4 space tabs for python
;(add-hook 'python-mode-hook
;	  (lambda ()
;	    (setq python-indent 4)
;	  )
;)

(when (require 'lsp-mode nil 'noerror)
  (require 'lsp-mode)
  (require 'lsp-python)
  (add-hook 'python-mode-hook #'lsp-python-enable)
  )
