
;; hide toolbar when in gui mode
(menu-bar-mode -1)
;(text-scale-decrease) ; go from 11 to 10 (Hope that works)

; these aren't working on el7 in text mode...
; what's the correct way to get rid of the scrollbar?
; emacs version?  only gui?
;(tool-bar-mode -1)
;(toggle-scroll-bar -1)

; show column in addition to line number in mode line
; interesting that this isn't the default?
(column-number-mode)

;; enable simple mouse clicks
;; not sure I like this because it interferes with mouse copy/paste (forces using shift key)
;; can enable manually when desired I guess (or always for gdb mode?)
;; (xterm-mouse-mode)

(setq inhibit-startup-screen t)

;; Whitespace settings
;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)

(setq linum-format "%4d ")

