
;; lsp-rust
(use-package lsp-rust
  :init
  ;;(setq lsp-rust-rls-command '("rls"))
  (add-hook 'rust-mode-hook 'lsp-rust-enable)
  (add-hook 'rust-mode-hook 'flycheck-mode)
  )

;; rust-mode
(use-package rust-mode)
