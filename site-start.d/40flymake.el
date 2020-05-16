
;; LSP will initiate flycheck, but not all modes...
(use-package flymake-mode
  :ensure nil
  :hook prog-mode)

;; show flymake errors in popup/minibuffer
(use-package flymake-diagnostic-at-point
  :after flymake
  ;;:custom
  ;; doing this in the minibuffer collides with lsp/eldoc, just show in popup for now
  ;;(flymake-diagnostic-at-point-display-diagnostic-function 'flymake-diagnostic-at-point-display-minibuffer)
  :config
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode)
  :custom
  ;; maybe this will make it so flymake isn't so slow?
  ;; I really wish it would give up if x number of errors
  (flymake-start-syntax-check-on-newline nil)
  )
