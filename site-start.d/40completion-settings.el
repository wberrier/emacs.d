
(add-to-list 'load-path "~/wa/git/company-mode")

(require 'company)

; irony-mode seems better as it integrates with cmake
; use company-irony because company-mode is a nice
; frontend for lots of different languages
; may also have to run "irony-install-server", which requires cmake and clang-devel
(add-to-list 'load-path "~/wa/git/irony-mode")

(require 'irony)
(require 'irony-cdb)

;; company plugin
(add-to-list 'load-path "~/wa/git/company-irony")

(require 'company-irony)


; loaded when other mode is loaded
;(add-hook 'c++-mode-hook 'irony-mode)
;(add-hook 'c-mode-hook 'irony-mode)
;(add-hook 'objc-mode-hook 'irony-mode)

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

;; TODO: add hook to look in well defined places form the cmake json database

;;;;;;;;;;;;;;;;;;;;

;; TODO: add yasnippet for completions?

;;;;;;;;;;;;;;;;;;;;

;; Now, to set up completion, with the same keybindings as
;; what vim would normally use: ctrl-p -> company-complete ?
;; and how to iterate forward and backward?

; evil already has evil-complete-previous/next
; so maybe just override those, and use ctrl-p/n to go between
; completions?  Will have to look how youcompleteme does...


