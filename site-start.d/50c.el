
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

;; TODO: look into cstyle/clangformat

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
                                   (arglist-intro . +) ;; indent one level
                                   ;;(arglist-intro . c-lineup-arglist-intro-after-paren) ;; arglist continuations (works nice with smarttabs)
                                   (arglist-cont . 0)
                                   (arglist-cont-nonempty . +)
                                   ;;(arglist-close . c-lineup-close-paren)
                                   ;;(arglist-close . c-lineup-arglist-close-under-paren)
                                   (arglist-close . +) ;; indent one level
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

(defun my-c-mode-common-hook ()
	;; Customizations for all modes in CC Mode.

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

	;; compile command for this mode
	(setq compile-command "~/.emacs.d/bin/emacsproject build")
	)

;; NOTE: this is really for c-mode, but there's no package called c-mode
;; and it's in a cc-mode.el file, just use that name
(use-package cc-mode
  :ensure nil ;; built-in
  ;; NOTE: apparently it's frowned upon to use lambdas in hooks
  ;; this seems to fix some hook ordering issues (specifically, with dtrt)
  :hook (c-mode-common . my-c-mode-common-hook)
  )

(use-package cc-vars
  :ensure nil
  :config
  (c-add-style "PERSONAL" my-c-style)
  :custom
  (c-default-style
   '(
	 (c-mode . "PERSONAL")
	 (c++-mode . "PERSONAL")
	 (java-mode . "java")
	 (awk-mode . "awk")
	 (other . "gnu")
     )
   )
  )

(use-package c++-mode
  :ensure nil ;; built-in-package
  ;; use c++-mode for .ipp files (boost uses lots of them)
  :mode "\\.ipp$"

  ;; just treat .h files as c++ mode... fixes some indenting issues
  :mode "\\.h$"
  )

; enable emacs debugging?
;(setq debug-on-error t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gdb settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: check out "realgud" ?

(use-package gud
  :ensure nil
  :init

  ;; ide-like debugging layout
  (setq gdb-many-windows t)

  ;; attempt to prevent output from taking over
  ;; prevents following source code... ?
  ;;(defun set-window-undedicated-p (window flag)
  ;;  "Never set window dedicated."
  ;;  flag)
  ;;(advice-add 'set-window-dedicated-p :override #'set-window-undedicated-p)

  :custom

  ;; speed up loading
  (gdb-create-source-file-list nil)


  ;; Don't force popup gdb's io window (requires emacs >= 25) (worked! the above didn't...)
  (gdb-display-io-nopopup t)

  (pop-up-windows nil)
  )
