;; Enable lsp-ui

(use-package lsp-mode
  :commands lsp
  :init
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  :custom
  ;; Enable symbol information
  ;;(lsp-enable-eldoc t)

  ;; Only show symbol "language" string
  ;;(lsp-eldoc-render-all nil)

  ;; Don't determine indentation.  Leave that up to the editor (dtrt-indent-mode)
  ;; Sometimes I would get weird indentation.  Maybe this is the reason... ?
  (lsp-enable-indentation nil)

  ;; Show lsp messages in *Messages*
  ;;(lsp-print-io t)
  )

(use-package imenu
  :ensure nil
  :custom
  (imenu-auto-rescan t)
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :init
  ;; Don't enable all of lsp-ui-mode's features, just enable as needed
  ;; (really only using flycheck)
  ;;(add-hook 'lsp-mode-hook 'lsp-ui-mode)

  :custom
  (lsp-ui-sideline-enable nil)
  ;; disable ui-doc since it behaves badly with wrapped lines and smooth scrolling
  ;; TODO: should file bug
  (lsp-ui-doc-enable nil)
  ;; Experimenting...
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'at-point)

  ;; TODO: could set up lsp-ui-peek bindings to replace xref
  )
