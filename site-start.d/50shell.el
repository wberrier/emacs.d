
(use-package sh-mode
  :ensure nil
  :init (add-hook 'sh-mode-hook #'lsp)
  :mode ("bash_profile" "bashrc")
  )
