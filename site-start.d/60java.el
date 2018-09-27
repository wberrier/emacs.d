
(use-package lsp-java
  :config
  (add-hook 'java-mode-hook 'lsp-java-enable)
  (add-hook 'java-mode-hook 'flycheck-mode)
  ;;(setq lsp-java--workspace-folders (list (error "XXX Specify your projects here")))
  :custom
  (lsp-java-organize-imports nil)
  (lsp-java-save-action-organize-imports nil)
  )
