
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

; irony-mode seems better as it integrates with cmake
; use company-irony because company-mode is a nice
; frontend for lots of different languages
; may also have to run "irony-install-server", which requires cmake and clang-devel
(require 'irony)
(require 'irony-cdb)

;; company plugin

(require 'company-irony)

; load here so that other c-modes don't load irony mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
          'irony-completion-at-point-async)
      (define-key irony-mode-map [remap complete-symbol]
	    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

; hook company-irony into company mode
(eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;;;;;;;;;;;;;;;;;;;;

;; TODO: add yasnippet for completions?

;;;;;;;;;;;;;;;;;;;;

;; Now, to set up completion, with the same keybindings as
;; what vim would normally use: ctrl-p -> company-complete ?
;; and how to iterate forward and backward?

; evil already has evil-complete-previous/next
; so maybe just override those, and use ctrl-p/n to go between
; completions?  Will have to look how youcompleteme does...

; indent if no snippets or completions?
(defun my-company-tab ()
  (interactive)
  (when (null (yas-expand))
    (company-select-next)
  )
)

;; hrm... how to get evil friendly maps?

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
;(define-key company-active-map (kbd "<tab>") 'my-company-tab)
;(define-key company-active-map (kbd "<tab>") 'company-select-next)
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
(setq company-idle-delay .1)

;; be able to complete headers as well
(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
