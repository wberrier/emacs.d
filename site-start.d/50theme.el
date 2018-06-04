
; great built in color theme
;(load-theme 'wombat t)

;; Nice monokai color theme
; seems to only work in 256 color mode
;;(use-package monokai-theme)

; seems to only work in 256 color mode, but has a nice 8 color fallback option
;;(use-package zenburn-theme)

; Very nice theme
;(setq solarized-termcolors 256) ; use 256 terminal color emulation
; forces dark theme
;(set-terminal-parameter nil 'background-mode 'dark)
;(set-frame-parameter nil 'background-mode 'dark)
;(load-theme 'solarized t)

;; this forces the dark theme when using emacs client...
;; why is this even necessary?
;(add-hook 'after-make-frame-functions
;          (lambda (frame)
;              (set-frame-parameter frame 'background-mode 'dark)
;              (set-terminal-parameter frame 'background-mode 'dark)
;            (enable-theme 'solarized)
;))

; ample theme
; ** like this one **
(use-package ample-theme)
;;(use-package zerodark-theme)

; sanityinc themes, can't seem to get them to work
;;(use-package color-theme-sanityinc-tomorrow)

; various theme options
;;(use-package base16-theme)
;;(use-package color-theme-solarized)
;;(use-package solarized-theme)
;;(use-package cyberpunk-theme)
;;(use-package moe-theme)

