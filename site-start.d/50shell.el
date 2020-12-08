
(use-package sh-mode
  :ensure nil
  :init (add-hook 'sh-mode-hook #'lsp)
  :mode ("bash_profile" "bashrc")
  )

(use-package flymake-shellcheck
  :commands flymake-shellcheck-load
  :init
  (add-hook 'sh-mode-hook 'flymake-shellcheck-load))

(defun my-compilation-start (proc)
  ;; We need to differentiate between compilation-mode buffers
  ;; and running as part of comint (which at this point we assume
  ;; has been configured separately for xterm-color)
  (when (eq (process-filter proc) 'compilation-filter)
	;; This is a process associated with a compilation-mode buffer.
	;; We may call `xterm-color-filter' before its own filter function.
	(set-process-filter
	 proc
	 (lambda (proc string)
	   (funcall 'compilation-filter proc
				(xterm-color-filter string)))))
  )

;; make compilation output color nice
(use-package xterm-color
  :init
  ;; got this hook from the xterm-color docs
  (add-hook 'compilation-start-hook #'my-compilation-start)
  )
