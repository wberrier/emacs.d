
;; lsp-rust
(use-package lsp-rust
  :config
  (add-hook 'rust-mode-hook 'lsp-rust-enable)
  (add-hook 'rust-mode-hook 'flycheck-mode)
  ;;(setq lsp-rust-rls-command '("rls"))
  )

;; rust-mode
(use-package rust-mode)
