
(use-package company
  :init

  ;; disable company mode when running gdb
  (setq company-global-modes '(not gud-mode))

  ;; set timeout to zero so that completion pops up instantly
  ;; hrm... doesn't really seem to do anything...
  ;; This seems to help with irony, but not with rtags
  (setq company-idle-delay .1)

  :config
  (add-hook 'after-init-hook 'global-company-mode)

  :general

  (company-active-map
    "C-n" 'company-select-next
    "C-p" 'company-select-previous

    ;; Don't use enter, because it interfereces with newlines...
    ;; But use tab instead for the completion key.
    ;; Not sure why both of these are neccessary?  Seems to do something with
    ;; only working either in the gui or command line mode?  Note sure...
    "RET" nil
    "<return>" nil
    "TAB" 'company-complete-selection
    "<tab>" 'company-complete-selection
    )

  ;; hrm... how to get evil friendly maps?

  ;;(define-key evil-insert-state-map  (kbd "<tab>") 'company-select-next)
  ;; huh?  What's backtab?  shift tab?
  ;;(define-key company-active-map (kbd "<backtab>") 'company-select-previous)

  ;;(define-key evil-normal-state-map (kbd "\C-n") 'company-select-next)
  ;;(define-key evil-normal-state-map (kbd "\C-p") 'company-select-previous)


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
  (push 'company-lsp company-backends)

  )


(use-package company-qml
  :config
  (push 'company-qml company-backends)
  )

