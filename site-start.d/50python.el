
;; NOTE: python-mode seems to detect indentation settings automatically

(use-package lsp-python
  :after (lsp-mode)
  :init (add-hook 'python-mode-hook #'lsp-python-enable)
  )

