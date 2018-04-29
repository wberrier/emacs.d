
(use-package markdown-mode
  :mode "\\.md\\'"
  :mode "\\.dox\\'"

  :config
  ;; Don't enable this by default... just enable manually as needed, depending on the type of doc
  ;; (I found myself disabling it a lot)
  ;;(add-hook 'markdown-mode-hook 'refill-mode) ; refill when writing paragraphs, finally!

  )

