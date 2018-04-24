
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; disable company mode when running gdb
(setq company-global-modes '(not gud-mode))

;; disable company caching, as server is faster (recommended in lsp documentation)
(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
;; async completion
(setq company-lsp-async t)

(require 'company-lsp)
(push 'company-lsp company-backends)

(push 'company-anaconda company-backends) ;; python
(push 'company-qml company-backends) ;; qml
(global-company-mode)

;; hrm... how to get evil friendly maps?

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
;(define-key evil-insert-state-map  (kbd "<tab>") 'company-select-next)
; huh?  What's backtab?  shift tab?
;(define-key company-active-map (kbd "<backtab>") 'company-select-previous)

; Don't use enter, because it interfereces with newlines...
; But use tab instead for the completion key.
; Not sure why both of these are neccessary?  Seems to do something with
; only working either in the gui or command line mode?  Note sure...
(define-key company-active-map (kbd "<return>") nil)
(define-key company-active-map (kbd "RET") nil)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
(define-key company-active-map (kbd "TAB") 'company-complete-selection)

;(define-key evil-normal-state-map (kbd "\C-n") 'company-select-next)
;(define-key evil-normal-state-map (kbd "\C-p") 'company-select-previous)

;; set timeout to zero so that completion pops up instantly
;; hrm... doesn't really seem to do anything...
;; This seems to help with irony, but not with rtags
;(setq company-idle-delay .1)
