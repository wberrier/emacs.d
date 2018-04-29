;; Enable lsp-ui

(use-package lsp-mode)

(use-package lsp-ui
  ;;:hook lsp-mode ; TODO: this not working... ?

  :after (lsp-mode)

  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)

  :init
  (setq lsp-ui-sideline-enable nil)
  (setq imenu-auto-rescan t)

  :config
  (require 'lsp-ui-peek)
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

  )
