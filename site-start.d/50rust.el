
;; lsp-rust
(use-package lsp-rust
  :init
  (add-hook 'rust-mode-hook 'lsp-rust-enable)
  (add-hook 'rust-mode-hook 'flycheck-mode)
  ;;:custom
  ;;(lsp-rust-rls-command '("rls"))
  )

;; rust-mode
(use-package rust-mode)
