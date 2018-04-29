;; Load various modes, with not much configuration

;; Protobuf syntax highlighting
(use-package protobuf-mode
    :mode "\\.proto\\'"
  )

;; qml syntax highlighting
(use-package qml-mode
  :mode "\\.qml\\'"
  )

(use-package cmake-mode
  :mode "CMakeLists\\.txt"
  :mode "\\.cmake$"

  :init
  (setq cmake-tab-width 4) ; 2 spaces is weird
  )

; don't fail if doesn't exist
; disable for now since this really slows things down when loading/saving files
;(when (require 'mercurial nil 'noerror))

(use-package yaml-mode
  :mode "\\.yml$"
  )

;; TODO: seems this may still have some issues?
(use-package meson-mode
  :config
  (add-hook 'meson-mode-hook 'company-mode)
  )

(use-package which-key
  :config
  (which-key-mode)
  )

(require 'qmake-mode)
