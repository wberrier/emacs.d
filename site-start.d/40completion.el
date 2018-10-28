
(use-package xref
  :ensure nil ;; don't install if it's missing, since it requires emacs 25.1
  :custom
  ;; don't prompt for identifiers
  (xref-prompt-for-identifier (quote (not xref-find-definitions xref-find-definitions-other-window xref-find-definitions-other-frame xref-find-references)))
  )

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)

  :custom

  ;; disable company mode when running gdb
  (company-global-modes '(not gud-mode))

  ;; set timeout to zero so that completion pops up instantly
  ;; hrm... doesn't really seem to do anything...
  ;; This seems to help with irony, but not with rtags
  (company-idle-delay .1)

  ;; Probably don't need to set this since can C-SPC to complete manually
  ;;(company-minimum-prefix-length 1)

  ;; be able to wrap completion list
  (company-selection-wrap-around t)

  :general
  ;; also allow tab (in addition to enter) to complete selection
  ;; some people like the ycm mode where tab/backtab go forwards and backwards
  (:keymaps 'company-active-map "TAB" 'company-complete-selection)

  ;; ctrl-space
  ;; show all completions (initiate completions when no text yet)
  (:keymaps 'global-map "C-@" nil) ;; required to allow C-SPC below
  (:states 'insert :keymaps 'company-mode-map "C-SPC" 'company-complete-common)

  ;; Typically package loading is deferred if bindings are specified
  ;; this forces it to load
  :demand
  )

(use-package company-lsp
  :init
  ;; disable company caching, as server is faster (recommended in lsp documentation)
  (setq
   company-transformers nil
   ;; async completion
   company-lsp-async t
   company-lsp-cache-candidates nil
   ;; Should help with c++ std:: type completions
   company-lsp-enable-recompletion t
   )


  :config
  ;; This merges snippets, but the snippets show up when completing on
  ;; a variable, so until then, just bind with another key
  ;;(push '(company-lsp :with company-yasnippet) company-backends)
  (push 'company-lsp company-backends)

  )


(use-package company-qml
  :config
  (push 'company-qml company-backends)
  )

