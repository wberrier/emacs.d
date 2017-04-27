
(require 'rtags)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

; disable company mode when running gdb
(setq company-global-modes '(not gud-mode))

;; TODO: not quite working, but there are 'rtags-symbol-info and 'rtags-print-symbol-info
;;(defun my-rtags-eldoc ()
;;  (when (and (not (nth 4 (syntax-ppss))) (thing-at-point 'symbol t))
;;    (let ((doc (rtags-get-summary-text)))
;;      (and doc (replace-regexp-in-string "{.*" ""
;;      (replace-regexp-in-string "[ \t\n]+" " "
;;      (replace-regexp-in-string "\n" "" doc)))))))
;;
;;(setq-local eldoc-documentation-function #'my-rtags-eldoc)
;;
;;(add-hook 'c-mode-hook 'eldoc-mode)
;;(add-hook 'c++-mode-hook 'eldoc-mode)

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(push 'company-anaconda company-backends) ;; python
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

;; rtags based flycheck
(require 'flycheck-rtags)
;; Not sure what this changes...
(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))
(add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'objc-mode-hook #'my-flycheck-rtags-setup)
