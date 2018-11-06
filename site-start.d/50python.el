
;; NOTE: python-mode seems to detect indentation settings automatically

(use-package lsp-python
  :after (lsp-mode)
  :init (add-hook 'python-mode-hook #'lsp-python-enable)
  :config
  (require 'dap-python)
  ;; add lsp-ui-flycheck to the end of the list of available checkers
  ;; (but don't select as the only one)
  (add-to-list 'flycheck-checkers 'lsp-ui t)
  )

