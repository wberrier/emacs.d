;; Other options

;; Compile options
(use-package compile
  :ensure nil
  :custom
  ;;(compilation-read-command nil) ;; don't prompt for command
  (compilation-scroll-output 'first-error) ;; scroll until the first error
  ;;(compilation-scroll-output t) ;; scroll to the end
)

; disable makefile warnings
(setq makefile-warn-suspicious-lines nil)
