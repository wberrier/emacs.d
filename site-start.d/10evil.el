
;; This is required before loading evil
;; and allows CTRL-r to work (redo)
(require 'undo-tree)

;; vim increment/decrement
(require 'evil-numbers)

;; Make CTRL - u scroll up like I'm used to in vi
;; This seems to be off by default
(setq evil-want-C-u-scroll t)
(setq evil-shift-width 4) ;; not sure what the default is here
(setq evil-search-module 'evil-search)
; treat underscore as a word char, finally! (for 'w' and searching)
; for c mode
(add-hook 'c-mode-common-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'qml-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
; and everything else
(modify-syntax-entry ?_ "w")
(require 'evil)

; also load evil leader and org modes
(require 'evil-leader)

;; evil-leader docs say to enable this before evil-mode
(global-evil-leader-mode)
;; Load evil by default
(evil-mode 1)

(require 'evil-org)

;; Indent after pressing return (like vim)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; but don't leaving trailing whitespace on abandoned indents
;; Clean indent
(require 'clean-aindent-mode)
(clean-aindent-mode 1) ;; enable for all modes

(setq evil-emacs-state-cursor `("red" box))
(setq evil-motion-state-cursor `("orange" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
