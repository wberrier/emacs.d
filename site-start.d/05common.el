
;; Other options
(setq vc-follow-symlinks nil)

(setq backup-directory-alist '(("." . "~/backup/emacs")))

;; Save place in files when visiting
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

;; Disable autosave
(setq auto-save-default nil)

;; Whitespace settings
;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)

;; Compile options
;(setq-default compilation-read-command nil) ;; don't prompt for command
(setq-default compilation-scroll-output 'first-error) ;; scroll until the first error
;(setq-default compilation-scroll-output t) ;; scroll to the end

; hide toolbar when in gui mode
; not working?
;(tool-bar-mode -1)
