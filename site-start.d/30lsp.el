;; Enable lsp-ui

(use-package lsp-mode
  :custom
  ;; Enable symbol information
  (lsp-enable-eldoc t)

  ;; Only show symbol "language" string
  (lsp-eldoc-render-all nil)

  ;; Don't determine indentation.  Leave that up to the editor (dtrt-indent-mode)
  ;; Sometimes I would get weird indentation.  Maybe this is the reason... ?
  (lsp-enable-indentation nil)

  ;; Show lsp messages in *Messages*
  ;;(lsp-print-io t)
  )

(use-package lsp-ui
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)

  :custom
  (lsp-ui-sideline-enable nil)
  (imenu-auto-rescan t)
  ;; disable ui-doc since it behaves badly with wrapped lines and smooth scrolling
  ;; TODO: should file bug
  (lsp-ui-doc-enable nil)
  ;; Experimenting...
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'at-point)

  :config
  (require 'lsp-ui-peek)
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-ui-peek-enable)

  ;; TODO: could set up lsp-ui-peek bindings to replace xref
  )
