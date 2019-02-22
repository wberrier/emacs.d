
;; html-mode is from this package
(use-package sgml-mode
  :ensure nil
  :init
  (add-hook 'html-mode-hook #'lsp)
  )
