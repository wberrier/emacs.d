
;; lsp-rust
(use-package lsp-rust
  :init
  (add-hook 'rust-mode-hook 'lsp-rust-enable)
  ;;:custom
  ;;(lsp-rust-rls-command '("rls"))

  ;; TODO: not working quite yet...
  ;;:config
  ;;(flycheck-disable-checker 'rust-cargo nil)
  ;;(add-to-list 'flycheck-checkers 'lsp-ui t)
  )

;; rust-mode
(use-package rust-mode)
