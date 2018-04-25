

;; these seem to be set up automatically with evil/emacs-lsp
;(define-key evil-normal-state-map (kbd "\C-]") 'xref-find-definitions)
;(define-key evil-normal-state-map (kbd "\C-t") 'pop-tag-mark)


(defun custom-find-derived ()
  (interactive)
  (cquery-xref-find-custom "$cquery/derived")
  )

(defun custom-find-callers ()
  (interactive)
  (cquery-xref-find-custom "$cquery/callers")
  )

(define-key evil-normal-state-map (kbd "\C-\\ c") 'xref-find-references)
;; TODO: how to define these inline?
(define-key evil-normal-state-map (kbd "\C-\\ v") 'custom-find-derived)
(define-key evil-normal-state-map (kbd "\C-\\ d") 'custom-find-callers)

;; TODO: emacs-lsp replacements?
;(define-key evil-normal-state-map (kbd "\C-\\ s") 'rtags-find-symbol)
;(define-key evil-normal-state-map (kbd "\C-\\ g") 'rtags-find-symbol) ; different than gtags-find-tag-from-here! huh?
;;(define-key evil-normal-state-map (kbd "\C-\\ f") 'rtags-find-file)
;;(define-key evil-normal-state-map (kbd "\C-\\ i") ')
;(define-key evil-normal-state-map (kbd "\C-\\ d") 'rtags-find-functions-called-by-this-function)
;(define-key evil-normal-state-map (kbd "\C-\\ l") 'rtags-list-results)
;(define-key evil-normal-state-map (kbd "\C-\\ t") 'rtags-symbol-type)

;; Sometimes tagging systems provide this functionality
;; projectile works just fine
(define-key evil-normal-state-map (kbd "\C-\\ e") 'projectile-ag)
(define-key evil-normal-state-map (kbd "\C-\\ f") 'projectile-find-file)

(evil-define-key 'normal rust-mode-map
  (kbd "\C-]")    'racer-find-definition
  (kbd "\C-t")    'pop-tag-mark ;; racer command??
  (kbd "\C-\\ t") 'racer-describe
  )

; vim increment/decrement
(define-key evil-normal-state-map (kbd "\C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "\C-x") 'evil-numbers/dec-at-pt)


;; Make ESC cancel a bunch of emacs type stuff.  Another suggested to
;; just get used to emacs' CTRL-g, but this is probably more natual for
;; someone coming from vim
;; http://wikemacs.org/wiki/Evil#Enter_an_emacs_mode_in_a_given_state
;; http://stackoverflow.com/questions/8483182/evil-mode-best-practice
(require 'delsel) ; for minibuffer-keyboard-quit
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

(defun bookmark-then-run-test ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "~/.emacs.d/bin/emacs_build test")
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
  "bt" 'bookmark-then-run-test
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
(evil-leader/set-key "t" 'neotree-project-dir)
