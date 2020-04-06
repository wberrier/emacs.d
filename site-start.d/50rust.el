
;; rust-mode
(use-package rust-mode
  :init
  (add-hook 'rust-mode-hook #'lsp)
  ;; Rust recommends spaces
  (add-hook 'rust-mode-hook
            (lambda () (setq indent-tabs-mode nil)))
  :custom
  ;; Use rust-analyzer over rls
  (lsp-rust-server (quote rust-analyzer))
  )

(use-package cargo
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  )
