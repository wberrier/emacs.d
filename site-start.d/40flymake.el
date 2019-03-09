
;; show flymake errors in popup/minibuffer
(use-package flymake-diagnostic-at-point
  :after flymake
  ;;:custom
  ;; doing this in the minibuffer collides with lsp/eldoc, just show in popup for now
  ;;(flymake-diagnostic-at-point-display-diagnostic-function 'flymake-diagnostic-at-point-display-minibuffer)
  :config
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode)
  )
