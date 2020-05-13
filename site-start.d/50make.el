
(use-package makefile-mode
  :ensure nil ;; built-in, don't attempt to download
  :init
  ;; Add some additional filenames
  :mode "make\\.inc$"
  :mode "Kbuild"
  ;; more inclusive than the default (ie: Makefile.blah)
  :mode "Makefile"
  )
