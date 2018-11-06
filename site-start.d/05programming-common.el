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

(defun my-prog-mode-stuff ()
  ;; Enable showing what current function is
  (which-function-mode 1)
  ;; Show syntax errors for all programming modes
  (flycheck-mode 1)
  )

(use-package prog-mode
  :ensure nil
  :init
  (add-hook 'prog-mode-hook 'my-prog-mode-stuff)
)
