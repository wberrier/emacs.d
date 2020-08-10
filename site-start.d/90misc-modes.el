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

(use-package yaml-mode
  :mode "\\.yml$"
  :mode "\\.bst$"
  )

;; TODO: seems this may still have some issues?
(use-package meson-mode
  :init
  (add-hook 'meson-mode-hook 'company-mode)
  )

(use-package which-key
  :init
  (which-key-mode)
  )

(use-package qmake-mode
  :load-path "~/.emacs.d/manual-packages/qmake-mode"
  :ensure nil ;; manual-package, don't attempt to download
  )

(use-package dts-mode
  :mode "\\.dts$"
  :mode "\\.dtsi$"
  )

(use-package bitbake
  :mode ("\\.bb$" . bitbake-mode)
  :mode ("\\.bbclass$" . bitbake-mode)
  )

(use-package kconfig-mode
  :mode ("Kconfig\\." . kconfig-mode)
  :mode ("AmbaConfig" . kconfig-mode)
  )

;; syntax highlighting for repo files
(use-package conf-mode
  :mode ("\\.repo\\'" . conf-mode)
  :ensure nil ;; built in
  )
