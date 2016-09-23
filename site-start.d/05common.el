
;; Other options
(setq vc-follow-symlinks nil)

; this makes loading/saving of files slow if it has to do git/hg status
;(setq vc-handled-backends ())

; Backup options
(setq
 backup-directory-alist '(("." . "~/backup/emacs"))
 backup-by-copying t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 )

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
(menu-bar-mode -1)
;(text-scale-decrease) ; go from 11 to 10 (Hope that works)

; these aren't working on el7 in text mode...
; what's the correct way to get rid of the scrollbar?
; emacs version?  only gui?
;(tool-bar-mode -1)
;(toggle-scroll-bar -1)

; define this here for load paths later on
(setq dist (substring (shell-command-to-string "~/bin/get_dist") 0 -1)) ; removes trailing newline

; add site-list specific to this machine (os, arch)
(add-to-list 'load-path (format "~/install/%s/share/emacs/site-lisp" dist))

; show column in addition to line number in mode line
; interesting that this isn't the default?
(column-number-mode)

(setq inhibit-startup-screen t)

; more like vim
(setq require-final-newline t)

; smooth scrolling (more like vim)
; but doesn't work really well...
;(setq scroll-margin 5
;      scroll-conservatively 9999
;      scroll-step 1)
