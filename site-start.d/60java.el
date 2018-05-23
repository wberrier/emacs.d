
;; TODO: use lsp-java

(use-package meghanada
  :init
  (add-hook 'java-mode-hook
            (lambda ()
              ;; meghanada-mode on
              (meghanada-mode t)
              ;;(setq c-basic-offset 2)
              ;; use code format
              ;;(add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
              )
            )

  )
