
;; rust-mode
(use-package rust-mode
  :init
  (add-hook 'rust-mode-hook #'lsp)
  ;; Rust recommends spaces
  (add-hook 'rust-mode-hook
            (lambda () (setq indent-tabs-mode nil)))
  ;; go into rust mode with rust-script scripts
  :mode "\\.ers$"
  :custom
  ;; Use rust-analyzer over rls
  (lsp-rust-server (quote rust-analyzer))
  )

(use-package cargo
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  )

;; Load rust-mode's compilation regexps for compilation-mode
;; (rust-mode adds rustc/cargo/clippy patterns to compilation-error-regexp-alist)
(with-eval-after-load 'compile
  (require 'rust-mode))
