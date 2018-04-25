
;; Create my personal style. (from the manual)
;; I think this actually works how I like it!!

; symbol meanings
; +   `c-basic-offset' times 1
; -   `c-basic-offset' times -1
; ++  `c-basic-offset' times 2
; --  `c-basic-offset' times -2
; *   `c-basic-offset' times 0.5
; /   `c-basic-offset' times -0.5
; 0   `c-basic-offset' times 0

;; the only things I modified in vim were to push back
;; "public/private" and case labels an indentation level

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 0) ; don't indent comment only lines
    ;(c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . (
                                   (arglist-intro . +)
                                   (arglist-cont . 0)
                                   (arglist-cont-nonempty . +)
                                   (arglist-close . +)
				   ;(arglist-close . c-lineup-close-paren)
                                   (substatement-open . 0)
                                   (case-label        . 0)
				   (access-label      . -) ; public/private: no indention (sometimes picks access-label, sometimes label??)
				   (label             . 0) ; public/private: no indention
                                   (block-open        . 0)
                                   (inline-open       . 0)
				   (innamespace       . [0]) ; don't indent inside of namespaces
                                   (knr-argdecl-intro . -)
				   )
				)
    (c-echo-syntactic-information-p . t))
  "My C Programming Style")
(c-add-style "PERSONAL" my-c-style)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "PERSONAL")
  ;; other customizations
  ;;(setq tab-width 8
  ;;(setq tab-width 4
  (setq tab-width 4 ;; just for some things
        ;; indent 2 for some
        c-basic-offset 4
        ;; this will make sure spaces are used instead of tabs
        ;; indent-tabs-mode nil)
        indent-tabs-mode t)
  ;; we like auto-newline, but not hungry-delete
  ;; these are all the cc-mode minor modes
  ;;(c-toggle-electric-state -1)
  ;;(c-toggle-auto-newline -1) ;; don't insert newlines when entering a semicolon (default)
  ;;(c-toggle-hungry-state 1) ;; weird... would be nice to go back the tab amount, but not newlines
  ;;(c-toggle-auto-hungry-state -1)
  ;;(c-toggle-syntactic-indentation 1)

  ;; indent on return?
  ;;(c-toggle-auto-state 1)

  ;; Make return indent the new line
  ;; But, this doesn't clean up abandoned indents
  ;;(define-key c-mode-base-map "\C-m" 'c-context-line-break)

  ; compile command for this mode
  (setq compile-command "~/emacs.d/bin/emacs_build")

  ;; Enable showing what current function is
  (which-function-mode 1)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'flycheck-mode)

; use c++-mode for .ipp files (boost uses lots of them)
(add-to-list 'auto-mode-alist '("\\.ipp\\'". c++-mode))
; just treat .h files as c++ mode... fixes some indenting issues
(add-to-list 'auto-mode-alist '("\\.h\\'". c++-mode))

; enable debugging?
;(setq debug-on-error t)

; ide-like debugging layout
(setq gdb-many-windows t)

; speed up loading
(setq gdb-create-source-file-list nil)

;; attempt to prevent output from taking over
;; prevents following source code... ?
;;(defun set-window-undedicated-p (window flag)
;;  "Never set window dedicated."
;;  flag)
;;(advice-add 'set-window-dedicated-p :override #'set-window-undedicated-p)

;; Don't force popup gdb's io window (requires emacs >= 25) (worked! the above didn't...)
(setq gdb-display-io-nopopup t)

(setq pop-up-windows nil)

;; cquery settings

;; Set executable path if expected environment variable is found
(if (equal (getenv "LOCAL_INSTALL_DIR") nil)
    nil
  (setq cquery-executable (format "%s/bin/cquery" (getenv "LOCAL_INSTALL_DIR")))
  )

;; TODO: use $HOME environment variable
(setq cquery-extra-args '("--log-file=/home/wberrier/.cq.log"))

(setq cquery-cache-dir (format "%s/.cquery_cached_index" (getenv "HOME")))

;; specify loading subprojects?
;; TODO: can this be used to find build*/compile_commands.json?
(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
	(append '("compile_commands.json"
		  ".cquery")
		projectile-project-root-files-top-down-recurring)))


;; Enable lsp for all c/c++ modes
(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

  (use-package cquery
    :commands lsp-cquery-enable
    :init (add-hook 'c-mode-common-hook #'cquery//enable))
;; Also see lsp-project-whitelist lsp-project-blacklist cquery-root-matchers

