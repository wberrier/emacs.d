
;; Set spaces since we default to tabs globally
;; dtrt doesn't seem to work well with dtrt
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            ;; Use spaces, not tabs
            (setq indent-tabs-mode nil)
            )
          )

