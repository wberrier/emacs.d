
;; Create my personal style. (from the manual)
;; I think this actually works how I like it!!

; symbol meanings
; +   `c-basic-offset' times 1
; -   `c-basic-offset' times -1
; ++  `c-basic-offset' times 2
; --  `c-basic-offset' times -2
; *   `c-basic-offset' times 0.5
; /   `c-basic-offset' times -0.5

;; the only things I modified in vim were to push back
;; "public/private" and case labels an indentation level

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 0)
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
                                   (arglist-cont-nonempty . ++)
                                   (arglist-close . ++)
				   ;(arglist-close . c-lineup-arglist)
				   ;(arglist-close . c-lineup-close-paren)
                                   (substatement-open . 0)
                                   (case-label        . 0)
				   ; not sure what this does...
                                   ;(arglist-intro     . '+)
                                   (block-open        . 0)
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
        indent-tabs-mode nil)
        ;;indent-tabs-mode t)
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
  (setq compile-command "cmake_build")

  ;; enable gnu global in cc mode
  (gtags-mode 1)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


; settings for ff-find-other-file to switch between headers/implementations

; set of directories to look for header/implementation
; was originally thinking to search all directories in gtags, but this should work
(setq ff-search-directories
  '(
    "."
    "../src"
    "../../src"
    "../include"
    "../include/*"
    "/usr/include"
    "/usr/include/*"
    "/usr/local/include"
    "/usr/local/include/*"
    )
  )
; Don't prompt to create when can't find
(setq ff-always-try-to-create nil)

; enable debugging?
;(setq debug-on-error t)

(setq gdb-many-windows t)
