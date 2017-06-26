
;; Other options
(setq vc-follow-symlinks nil)

; this makes loading/saving of files slow if it has to do git/hg status
;(setq vc-handled-backends ())

; create the backup directory if it doesn't exist
(if (file-exists-p "~/backup/emacs")
  nil
  (make-directory "~/backup/emacs" t)
  )

; Backup options
(setq
 backup-directory-alist '(("." . "~/backup/emacs"))
 backup-by-copying t ; don't clobber symlinks
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

;; Default to spaces instead of tabs
;; TODO: figure out the "infer-indentation-style"?
(setq-default indent-tabs-mode t)

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

; add site-list specific to this machine (os, arch)
(add-to-list 'load-path (format "%s/share/emacs/site-lisp" local-install-dir))


; show column in addition to line number in mode line
; interesting that this isn't the default?
(column-number-mode)

; Stuff from Shawn's config
(setq inhibit-startup-screen t)

; more like vim
(setq require-final-newline t)

;; Smooth Scrolling
;; Note sure I'd like this, but can play with it...
;; I think I like emacs "optimized" scrolling, but it's weird to get used to
;; Interesting, by default, vim scroll margin is 0
;; -> I think this is easier to follow
;; -> This has some quirks, doesn't always work, disable for now (ctrl-d on bottom of page jumps around)
;(setq scroll-margin 5
;      scroll-conservatively 9999
;      scroll-step 1)

;; nicer scrolling (wow, actually matches vim)
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 1)

; disable makefile warnings
(setq makefile-warn-suspicious-lines nil)

(setq linum-format "%4d ")
