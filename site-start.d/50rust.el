
;; rust-mode
(use-package rust-mode
  :init
  (add-hook 'rust-mode-hook #'lsp)
  ;; Rust recommends spaces
  (add-hook 'rust-mode-hook
            (lambda () (setq indent-tabs-mode nil)))
  ;; go into rust mode with cargo-eval scripts
  :mode "\\.crs$"
  :custom
  ;; Use rust-analyzer over rls
  (lsp-rust-server (quote rust-analyzer))
  )

(use-package cargo
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  :custom
  ;; This defaults to using nightly args to work around a bug, but was fixed in 1.52.0
  (cargo-process--command-clippy "clippy")
  )
