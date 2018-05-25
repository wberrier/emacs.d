;; Enable lsp-ui

(use-package lsp-mode)

(use-package lsp-ui

  :after (lsp-mode)

  ;; NOTE: must use this hook syntax
  :hook ((lsp-mode) . lsp-ui-mode)

  :init
  (setq lsp-ui-sideline-enable nil)
  (setq imenu-auto-rescan t)

  :config
  (require 'lsp-ui-peek)
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

  )
