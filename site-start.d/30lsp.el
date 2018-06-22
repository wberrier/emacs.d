;; Enable lsp-ui

(use-package lsp-mode)

(use-package lsp-ui

  :after (lsp-mode)

  ;; NOTE: must use this hook syntax
  :hook ((lsp-mode) . lsp-ui-mode)

  :init
  (setq lsp-ui-sideline-enable nil)
  (setq imenu-auto-rescan t)
  ;; disable ui-doc since it behaves badly with wrapped lines and smooth scrolling
  ;; TODO: should file bug
  (setq lsp-ui-doc-enable nil)

  :config
  (require 'lsp-ui-peek)
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

  )
