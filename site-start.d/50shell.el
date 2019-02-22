
(use-package shell
  :ensure nil
  :init (add-hook 'sh-mode-hook #'lsp)
  )
