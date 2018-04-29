
(use-package flycheck
  :init
  (setq flycheck-error-list-minimum-level (quote warning))
  ;;:config
  ;; it's a bit overkill... just enable for each mode for now
  ;;(global-flycheck-mode)
  )

(use-package flycheck-objc-clang)
