
(use-package lsp-javascript-typescript
  :init
  ;; Something wrong when editing some files, interupts typing flow...
  ;; will have to investigate later
  (add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
  )
