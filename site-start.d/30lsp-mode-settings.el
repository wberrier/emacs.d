;; Enable lsp-ui

;; don't find this particularly helpful, and it gets in the way
(setq lsp-ui-sideline-enable nil)

(require 'lsp-ui)
(require 'lsp-ui-peek)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(setq imenu-auto-rescan t)
(require 'helm-imenu)
(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

