
;; eldoc isn't playing nicely with my python setup... (as of Dec '18... ?)
(defun disable-eldoc ()
    (eldoc-mode 0)
    )

;; NOTE: python-mode seems to detect indentation settings automatically
(use-package python
  :ensure nil
  :init
  (add-hook 'python-mode-hook #'disable-eldoc)
  (add-hook 'python-mode-hook #'lsp)
  :custom
  ;; Not sure how to change this dynamically, so at least know what to change
  (python-shell-interpreter "python3")
  :config
  (require 'dap-python)
  ;; add lsp-ui-flycheck to the end of the list of available checkers
  ;; (but don't select as the only one)
  (add-to-list 'flycheck-checkers 'lsp-ui t)
  )

