;; 4 tabs instead of the 8 default
;; NOTE: this makes it global for all files
(setq-default tab-width 4)
(setq-default tab-stop-list '(4 8 12))

(use-package dtrt-indent
  :custom
  (dtrt-indent-global-mode t)
  (dtrt-indent-verbosity 2)

  ;; Run even when "smie" is in use (Simple Minded Indentation Engine)
  (dtrt-indent-run-after-smie t)

  ;; run "adapt" after getting into this mode
  :hook ((
          ;; this runs automatically for modes derived from prog-mode, text-mode and javascript-mode
          ;; run for these other modes as well...
          bitbake-mode
          protobuf-mode
          ) . dtrt-indent-adapt)

  ;; don't show in modeline
  :diminish dtrt-indent-mode
  )

;; TODO: this forces tabs in whitespace mode, need to
;; figure out how to enable only after dtrt detects tabs
;; (use-package smart-tabs-mode
;;   :config
;;   ;; enable smart tabs for various languages
;;   (smart-tabs-insinuate 'c 'c++ 'java 'javascript)
;;   )

;; This does more than indenting, but can make emacs respect .editorconfig files
;; See editorconfig.org
(use-package editorconfig
  :config
  (editorconfig-mode 1)
  )
