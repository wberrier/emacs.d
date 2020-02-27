
(use-package lua-mode
  :mode "\\.lua\\'"
  :mode "\\.acs\\'"
  )

(use-package flymake-lua
  :commands flymake-lua-load
  :init
  (add-hook 'lua-mode-hook 'flymake-lua-load))
