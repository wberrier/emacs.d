;; Enable lsp-mode

(use-package lsp-mode
  :commands lsp
  :hook (
         (c-mode . lsp)
         (c++-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration)
         )
  :init
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  :custom
  ;; Enable symbol information
  ;;(lsp-enable-eldoc t)

  ;; Only show symbol "language" string
  ;;(lsp-eldoc-render-all nil)

  ;; Don't determine indentation.  Leave that up to the editor (dtrt-indent-mode)
  ;; Sometimes I would get weird indentation.  Maybe this is the reason... ?
  (lsp-enable-indentation nil)

  ;; nor text formatting from the server...
  (lsp-completion-enable-additional-text-edit nil)
  (lsp-enable-on-type-formatting nil)

  ;; Show lsp messages in *Messages*
  ;;(lsp-print-io t)

  ;; disable symbol highlighting (in attempt to not interrupt typing)
  ;; -> nope, didn't help
  ;;(lsp-enable-symbol-highlighting nil)

  ;; Don't highlight current symbol, just the other references
  ;;(lsp-symbol-highlighting-skip-current t)

  ;; this enabled takes a long time on big projects, not sure it's necessary?
  (lsp-enable-file-watchers nil)

  ;; TODO: add some stuff to this
  ;;(lsp-file-watch-ignored )

  ;; use clangd wrapper to generate compile_commands.json through clip
  (lsp-clients-clangd-executable (format "%s/wa/git/clip/bin/clip" (getenv "HOME")))
  (lsp-clients-clangd-args '("start-clangd"))

  )

(use-package imenu
  :ensure nil
  :custom
  (imenu-auto-rescan t)
  )
