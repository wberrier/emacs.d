
(use-package xref
  :ensure nil ;; don't install if it's missing, since it requires emacs 25.1
  :custom
  ;; don't prompt for identifiers
  (xref-prompt-for-identifier (quote (not xref-find-definitions xref-find-definitions-other-window xref-find-definitions-other-frame xref-find-references)))
  )

(use-package company
  :init

  ;; disable company mode when running gdb
  (setq company-global-modes '(not gud-mode))

  ;; set timeout to zero so that completion pops up instantly
  ;; hrm... doesn't really seem to do anything...
  ;; This seems to help with irony, but not with rtags
  (setq company-idle-delay .1)

  (add-hook 'after-init-hook 'global-company-mode)

  :general

  ;; Typically package loading is deferred if bindings are specified
  ;; this forces it to load
  :demand
  )

(use-package company-lsp
  :init
  ;; disable company caching, as server is faster (recommended in lsp documentation)
  (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)

  ;; async completion
  (setq company-lsp-async t)

  ;; Should help with c++ std:: type completions
  (setq company-lsp-enable-recompletion t)

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

