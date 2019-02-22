
(use-package js
  :ensure nil
  :init
  ;; Something wrong when editing some files, interupts typing flow...
  ;; will have to investigate later
  ;; Something to do with company mode
  (add-hook 'js-mode-hook #'lsp)
  )
