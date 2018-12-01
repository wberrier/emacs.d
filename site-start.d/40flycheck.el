
(use-package flycheck
  :init
  ;; Run pylint after running flake8
  (flycheck-add-next-checker 'python-flake8 'python-pylint)
  ;;:config
  ;; it's a bit overkill... just enable for each mode for now
  ;;(global-flycheck-mode)
  :custom
  ;;(flycheck-error-list-minimum-level (quote warning))

  (flycheck-checker-error-threshold 1000)

  ;; not sure how to change these dynamically, so at least allow changing as necessary
  (flycheck-python-flake8-executable "python3")
  (flycheck-python-pylint-executable "python3")
  (flycheck-python-pycompile-executable "python3")
  )

