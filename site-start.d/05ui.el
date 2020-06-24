
;; hide menu bar (File, Edit, etc...) when in gui mode
(menu-bar-mode -1)
;(text-scale-decrease) ; go from 11 to 10 (Hope that works)

;; Don't show the toolbar in gui mode
;; NOTE: for cases where the toolbar is useful (gdb, dap-mode, etc...) this can always be toggled as necessary
(tool-bar-mode -1)

;; Don't show scrollbars in gui mode
;; They look really bad, particularly when using split screen modes
(scroll-bar-mode -1)

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
;; TODO: check out ws-butler, looks to trim whitespace only for stuff
;; you've changed

(setq linum-format "%4d ")

