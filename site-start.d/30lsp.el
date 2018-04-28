;; Enable lsp-ui

;; don't find this particularly helpful, and it gets in the way
(setq lsp-ui-sideline-enable nil)

;; Must have emacs 25.1 or later...
(when (require 'lsp-ui nil 'noerror)
  (require 'lsp-ui)
  (require 'lsp-ui-peek)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)

  (setq imenu-auto-rescan t)
  ;;(require 'helm-imenu) ;; switched to ivy, missing anything by not having this?
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  )

