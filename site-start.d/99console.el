;; "unset" the background color, which messes up copying and pasting
;; out of emacs When running from the console
;; (unless window-system
;;   (set-face-attribute 'default nil :background "unspecified-bg")
;;   )

;; NOTE: the above didn't work, some backgrounds are still being set in some cases (comments in one case)
;; Probably easier to toggle global-font-lock-mode temporarily as needed
;; (terminal vim seems to do this really well, not sure why emacs struggles with it)

;; seems like the main issue is that comments have text that gets copied to the end of the line (maybe other sections too)
