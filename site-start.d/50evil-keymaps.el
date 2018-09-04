
(defun custom-find-derived ()
  (interactive)
  (cquery-xref-find-custom "$cquery/derived")
  )

(defun custom-find-callers ()
  (interactive)
  (cquery-xref-find-custom "$cquery/callers")
  )

;; how are these used?

(defun custom-find-base ()
  (interactive)
  (cquery-xref-find-custom "$cquery/base")
  )

(defun custom-find-vars ()
  (interactive)
  (cquery-xref-find-custom "$cquery/vars")
  )

;; TODO: where to put these?
(use-package projectile)
(use-package ag)

(defun my-projectile-ag-regexp ()
  (interactive)
  (setq current-prefix-arg t) ;; not sure this is accurate, but it works
  (call-interactively 'projectile-ag)
  )

;; TODO: only define these for certain modes?
(general-define-key
  :states 'normal

  ;; modeled after maps here: http://cscope.sourceforge.net/cscope_maps.vim

  ;; these seem to be set up automatically with evil/emacs-lsp
  ;;"\C-]" 'xref-find-definitions
  ;;"\C-t" 'pop-tag-mark

  "\C-\\ s" 'xref-find-references
  ;; TODO: how to define these inline?  Lambda?
  "\C-\\ v" 'custom-find-derived
  "\C-\\ c" 'custom-find-callers

  ;;; TODO: emacs-lsp replacements?
  ;;"\C-\\ g" 'rtags-find-symbol ; different than gtags-find-tag-from-here! huh?
  ;;;"\C-\\ i" 'find-includes ;; not sure it's needed since xref-find-references works for this
  ;;"\C-\\ d" 'rtags-find-functions-called-by-this-function
  ;;"\C-\\ l" 'rtags-list-results

  ;; Sometimes tagging systems provide this functionality
  ;; projectile works just fine
  "\C-\\ e" 'projectile-ag
  "\C-\\ r" 'my-projectile-ag-regexp
  "\C-\\ f" 'projectile-find-file

  )

;; leader key setup
(general-create-definer my-leader-def
  :prefix "\\"
  )

;; vim increment/decrement
(general-define-key
  :states 'normal

  "\C-a" 'evil-numbers/inc-at-pt
  "\C-x" 'evil-numbers/dec-at-pt
)

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

(defun emacs-debug ()
  (interactive)
  (gdb "~/.emacs.d/bin/emacs_debug")
  )

(my-leader-def
  :keymaps 'normal
  ;; "build release/cross/debug"
  "br" 'bookmark-then-compile
  "bc" 'bookmark-then-compile-cross
  "bd" 'bookmark-then-compile-debug
  "t" 'bookmark-then-run-test ;; no prefix to correspond with 'debug'
  ;; "return"
  "r"  'jump-to-compile-bookmark
  ;; run debugger
  "d"  'emacs-debug
  )

;; make sure this is set up when going into org-mode
;; seems like a hack that shouldn't necessary, but it works
;; TODO: these not working with general?
(general-define-key :states 'normal :keymaps 'org-mode-map "TAB" 'org-cycle)
(general-define-key :states 'normal :keymaps 'markdown-mode-map "TAB" 'markdown-cycle)

(my-leader-def
  :keymaps 'normal
  ;; set up key combo to show whitespace chars
  "w" 'whitespace-mode
  ;; Reformat text (ported from vim config)
  ;; I like fill-paragraph better than vim's reformat (better suited to text)
  "p" 'fill-paragraph
  ;; Switch between header and implementation
  "o" 'projectile-find-other-file
  ;; Generate a password
  ;; TODO: need to figure out how to capture output and insert into buffer
  ;;  or, just do the vim command?  Not sure how that works...
  ;;"g" 'generate-password
  "n" 'neotree-project-dir
  "f" 'switch-to-buffer

  ;; lsp-ui-imenu
  "i" 'lsp-ui-imenu
  )

(use-package evil-collection
  :after evil
  :ensure t
  :config
  ;; Nice that I can pick and choose
  ;; I was setting a lot of bindings for several of these
  (evil-collection-init '(
                          ag
                          comint
                          company
                          compile
                          custom
                          diff-mode
                          dired
                          ediff
                          eldoc
                          flycheck
                          grep
                          ivy
                          kotlin
                          log-view
                          lsp-ui-imenu
                          neotree
                          package-menu
                          vc-annotate
                          xref
                          ))
  ;; Others to consider: python, all?
  )
