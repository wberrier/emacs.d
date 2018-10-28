
;; dap-java is included in dap-mode
;; doing this tries to download a dap-java package
;; (use-package dap-java
;;   :after 'lsp-java
;;   )

(use-package lsp-java
  :init
  (add-hook 'java-mode-hook 'lsp-java-enable)
  (add-hook 'java-mode-hook 'flycheck-mode)
  :config
  (require 'dap-java)
  :custom
  ;;(lsp-java--workspace-folders (list (error "XXX Specify your projects here")))
  (lsp-java-organize-imports nil)
  (lsp-java-save-action-organize-imports nil)
  ;; Use the source paths looking for sources instead of classpath
  ;; (until dap-mode works better)
  (gud-jdb-use-classpath nil)
  (gud-jdb-command-name "jdb -attach localhost:10000")
  )
