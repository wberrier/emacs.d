
(use-package yasnippet
  :config
  (yas-global-mode 1)
  )

(use-package yasnippet-snippets)

;; Use ivy to load snippet since grouping lsp and yasnippet into a company
;; completion list doesn't work well
(use-package ivy-yasnippet)
