
;; This is required before loading evil
;; and allows CTRL-r to work (redo)
(load "~/wa/git/evil/lib/undo-tree")
(require 'undo-tree)

;; vim increment/decrement
(add-to-list 'load-path "~/wa/git/evil-numbers")
(require 'evil-numbers)

;; Set up evil to be in the path
;; This is just a checked out version from git
(add-to-list 'load-path "~/wa/git/evil")

;; Make CTRL - u scroll up like I'm used to in vi
;; This seems to be off by default
(setq evil-want-C-u-scroll t)
(setq evil-shift-width 4) ;; not sure what the default is here
(setq evil-search-module 'evil-search)
; treat underscore as a word char, finally! (for 'w' and searching)
; for c mode
(add-hook 'c-mode-common-hook #'(lambda () (modify-syntax-entry ?_ "w")))
; and everything else
(modify-syntax-entry ?_ "w")
(require 'evil)
;; Load evil by default
(evil-mode 1)

;; Indent after pressing return (like vim)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; but don't leaving trailing whitespace on abandoned indents
;; Clean indent
(add-to-list 'load-path "~/wa/git/clean-aindent")
(require 'clean-aindent-mode)
(clean-aindent-mode 1) ;; enable for all modes