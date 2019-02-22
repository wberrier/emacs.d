
;; golang lsp

(use-package go-mode
  :mode "\\.go$"
  :init
  (add-hook 'go-mode-hook #'lsp)
  )

