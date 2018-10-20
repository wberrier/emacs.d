
;; golang lsp

(use-package lsp-go
  :init
  (add-hook 'go-mode-hook #'lsp-go-enable)
)

(use-package go-mode
  :mode "\\.go$"
  )

