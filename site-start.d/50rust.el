
;; lsp-rust
(use-package lsp-rust
  :init
  (add-hook 'rust-mode-hook 'lsp-rust-enable)
  ;;:custom
  ;;(lsp-rust-rls-command '("rls"))
  )

;; rust-mode
(use-package rust-mode)
