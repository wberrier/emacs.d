
;; rust-mode
(use-package rust-mode
  :init
  (add-hook 'rust-mode-hook #'lsp)
  )

(use-package cargo
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  )
