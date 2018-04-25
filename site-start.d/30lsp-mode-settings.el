;; Enable lsp-ui
(require 'lsp-ui)
(require 'lsp-ui-peek)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

