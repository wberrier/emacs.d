;; Enable lsp-mode

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

  ;; disable symbol highlighting (in attempt to not interrupt typing)
  ;; -> nope, didn't help
  ;;(lsp-enable-symbol-highlighting nil)

  ;; Don't highlight current symbol, just the other references
  ;;(lsp-symbol-highlighting-skip-current t)

  )

(use-package imenu
  :ensure nil
  :custom
  (imenu-auto-rescan t)
  )
