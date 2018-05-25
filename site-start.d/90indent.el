
(use-package dtrt-indent
  :custom
  (dtrt-indent-global-mode t)
  (dtrt-indent-verbosity 2)
  (dtrt-indent-run-after-smie t)

  ;; don't show in modeline
  :diminish dtrt-indent-mode
  )

(use-package smart-tabs-mode
  :config
  ;; enable smart tabs for various languages
  (smart-tabs-insinuate 'c 'c++ 'java 'javascript)
  )
