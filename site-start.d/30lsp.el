;; Enable lsp-ui

(use-package lsp-mode
  :custom
  ;; Only show the signature for the doc hover
  ;; otherwise it shows the full text and it's very jarring
  ;;(lsp-hover-text-function (quote lsp--text-document-signature-help))
  ;; The above doesn't seem to work, and this is the default, keep this here until the above works
  (lsp-hover-text-function (quote lsp--text-document-hover-string))
  ;; disable eldoc until the above is straightened out
  ;; until then, use lsp-describe-thing-at-point
  (lsp-enable-eldoc nil)

  ;; Don't determine indentation.  Leave that up to the editor (dtrt-indent-mode)
  ;; Sometimes I would get weird indentation.  Maybe this is the reason... ?
  (lsp-enable-indentation nil)
  )

(use-package lsp-ui

  :after (lsp-mode)

  ;; NOTE: must use this hook syntax
  :hook ((lsp-mode) . lsp-ui-mode)

  :init
  (setq lsp-ui-sideline-enable nil)
  (setq imenu-auto-rescan t)
  ;; disable ui-doc since it behaves badly with wrapped lines and smooth scrolling
  ;; TODO: should file bug
  (setq lsp-ui-doc-enable nil)

  :config
  (require 'lsp-ui-peek)
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

  )
