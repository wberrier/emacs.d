;; Enable lsp-mode

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

;; NOTE: ended up not using lsp-ui, turned most of it off anyways
;; and seems to interfere with flycheck
;; it seems to have flycheck integration for lsp, but it didn't seem
;; to work very well
