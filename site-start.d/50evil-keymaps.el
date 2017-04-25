

; Set up key bindings for tags
(define-key evil-normal-state-map (kbd "\C-]") 'rtags-find-symbol-at-point)
(define-key evil-normal-state-map (kbd "\C-t") 'rtags-location-stack-back)

; Set up some keybindings for the cscope interaction
; although, it doesn't grab the current expression under the curson :(
; could write the equivalent "-from-here" functions...
; I guess this is where the shortcomings begin?
; but, it automatically puts the current symbol in the interactive buffer
; TODO: any way to automatically press enter?
; NOTE: not exactly sure what the difference is for some of these
(define-key evil-normal-state-map (kbd "\C-\\ s") 'rtags-find-symbol)
(define-key evil-normal-state-map (kbd "\C-\\ g") 'rtags-find-symbol) ; different than gtags-find-tag-from-here! huh?
(define-key evil-normal-state-map (kbd "\C-\\ c") 'rtags-find-references-at-point)
;; what are some replacements for rtags?
;(define-key evil-normal-state-map (kbd "\C-\\ t") 'gtags-find-pattern) ; same as gtags-find-with-grep
;(define-key evil-normal-state-map (kbd "\C-\\ e") 'gtags-find-with-grep)
(define-key evil-normal-state-map (kbd "\C-\\ e") 'projectile-grep)
;(define-key evil-normal-state-map (kbd "\C-\\ f") 'rtags-find-file)
(define-key evil-normal-state-map (kbd "\C-\\ f") 'projectile-find-file)
;(define-key evil-normal-state-map (kbd "\C-\\ i") ')
(define-key evil-normal-state-map (kbd "\C-\\ d") 'rtags-find-functions-called-by-this-function)
(define-key evil-normal-state-map (kbd "\C-\\ l") 'rtags-list-results)
(define-key evil-normal-state-map (kbd "\C-\\ t") 'rtags-symbol-type)

; vim increment/decrement
(define-key evil-normal-state-map (kbd "\C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "\C-x") 'evil-numbers/dec-at-pt)

;; Allow "RET" to work with rtags when running under evil
(defun intercept-evil-ret ()
  (interactive) ;; huh?
  ;(if (eq major-mode 'rtags-mode) (rtags-select) (evil-ret))
  (if (eq major-mode 'rtags-mode) (rtags-select-and-remove-rtags-buffer) (evil-ret))
  )
(define-key evil-motion-state-map (kbd "RET") 'intercept-evil-ret)

; Make ESC cancel a bunch of emacs type stuff.  Another suggested to
; just get used to emacs' CTRL-g, but this is probably more natual for
; someone coming from vim
; http://wikemacs.org/wiki/Evil#Enter_an_emacs_mode_in_a_given_state
;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
; more?

; Other various keymaps

;; set up key combo to show whitespace chars
(evil-leader/set-key "w" 'whitespace-mode)

; Some functions and and keymaps to compile code

; TODO: concatenating with compile-command ends up growing that command
; just hard code to cmake-build for now...
(defun bookmark-then-compile ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "~/.emacs.d/bin/emacs_build")
  )

(defun bookmark-then-compile-cross ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "~/.emacs.d/bin/emacs_build cross")
  )

(defun bookmark-then-compile-debug ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "~/.emacs.d/bin/emacs_build debug")
  )

(defun jump-to-compile-bookmark ()
  (interactive)
  (bookmark-jump "compile-bookmark") ; set a bookmark to easily return to
  )

; "build release/cross/debug"
(evil-leader/set-key
  "br" 'bookmark-then-compile
  "bc" 'bookmark-then-compile-cross
  "bd" 'bookmark-then-compile-debug
  ; "return"
  "r"  'jump-to-compile-bookmark
  )

(defun emacs-debug ()
  (interactive)
  (gdb "~/.emacs.d/bin/emacs_debug")
  )

; Start debugger
(evil-leader/set-key
  ; run debugger
  "d"  'emacs-debug
  )

;; Reformat text (ported from vim config)
;; I like fill-paragraph better than vim's reformat (better suited to text)
(evil-leader/set-key "p" 'fill-paragraph)

;; Switch between header and implementation
(evil-leader/set-key "o" 'projectile-find-other-file)

;; make sure this is set up when going into org-mode
;; seems like a hack that shouldn't necessary, but it works
(evil-define-key 'normal org-mode-map (kbd "TAB") #'org-cycle)
(evil-define-key 'normal markdown-mode-map (kbd "TAB") #'markdown-cycle)

;; Generate a password
;; TODO: need to figure out how to capture output and insert into buffer
;;  or, just do the vim command?  Not sure how that works...
;(evil-leader/set-key "g" 'generate-password)

;; evil rebellion, standardizes a bunch of keymaps to make emacs more vi friendly
;; (require 'evil-rebellion)

;; neotree integration
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-leader/set-key "t" 'neotree-toggle)
