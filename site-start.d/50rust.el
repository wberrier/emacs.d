
;; TODO: use lsp-rust

;; flycheck and tags

;; Dependencies
(use-package racer)
(use-package flycheck-rust)
(use-package cargo)

;; rust-mode
(use-package rust-mode

  :init
  (setq company-tooltip-align-annotations t)

  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)

  (add-hook 'rust-mode-hook #'cargo-minor-mode)

  ;; Code completion
  (add-hook 'racer-mode-hook #'company-mode)

  :general
  ;; TODO: necessary?
  (:keymaps 'rust-mode-map "TAB" 'company-indent-or-complete-common)

  )
