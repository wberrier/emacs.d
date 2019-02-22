
;; rust-mode
(use-package rust-mode
  :init
  (add-hook 'rust-mode-hook #'lsp)
  ;; TODO: not working quite yet...
  ;;:config
  ;;(flycheck-disable-checker 'rust-cargo nil)
  ;;(add-to-list 'flycheck-checkers 'lsp-ui t)
  )
