
(defun my-projectile-ripgrep-regexp ()
  (interactive)
  (setq current-prefix-arg t) ;; not sure this is accurate, but it works
  (call-interactively 'projectile-ripgrep)
  )

;; TODO: only define these for certain modes?
(general-define-key
  :states 'normal

  ;; modeled after maps here: http://cscope.sourceforge.net/cscope_maps.vim

  ;; these seem to be set up automatically with evil/emacs-lsp
  ;;"\C-]" 'xref-find-definitions
  ;;"\C-t" 'pop-tag-mark

  "\C-\\ s" 'xref-find-references

  ;; Show full documentation
  "\C-\\ d" 'lsp-describe-thing-at-point

  ;;; TODO: emacs-lsp replacements?
  ;;"\C-\\ g" 'rtags-find-symbol ; different than gtags-find-tag-from-here! huh?
  ;;;"\C-\\ i" 'find-includes ;; not sure it's needed since xref-find-references works for this
  ;;"\C-\\ d" 'rtags-find-functions-called-by-this-function
  ;;"\C-\\ l" 'rtags-list-results

  ;; Sometimes tagging systems provide this functionality
  ;; projectile works just fine
  "\C-\\ e" 'projectile-ripgrep
  "\C-\\ r" 'my-projectile-ripgrep-regexp
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

; Some functions and and keymaps to compile code

; TODO: concatenating with compile-command ends up growing that command
; just hard code to cmake-build for now...
(defun bookmark-then-compile ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "~/.emacs.d/bin/emacsproject build")
  )

(defun bookmark-then-compile-cross ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "~/.emacs.d/bin/emacsproject build cross")
  )

(defun bookmark-then-compile-debug ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "~/.emacs.d/bin/emacsproject build debug")
  )

(defun bookmark-then-run-test ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "~/.emacs.d/bin/emacsproject test")
  )

(defun jump-to-compile-bookmark ()
  (interactive)
  (bookmark-jump "compile-bookmark") ; set a bookmark to easily return to
  )

(defun emacs-debug ()
  (interactive)
  (gdb "~/.emacs.d/bin/emacsproject debug")
  )

;; Can add other formatting functions for various modes
(defun format-code ()
  (interactive)
  (if (equal major-mode 'rust-mode)
      (rust-format-buffer)))

(my-leader-def
  :keymaps 'normal
  ;; "build: release/cross/debug"
  "br" 'bookmark-then-compile
  "bc" 'bookmark-then-compile-cross
  "bd" 'bookmark-then-compile-debug
  "t" 'bookmark-then-run-test ;; no prefix to correspond with 'debug'
  ;; "return"
  "r"  'jump-to-compile-bookmark
  ;; run debugger
  "d"  'emacs-debug

  ;; format code "code: format"
  "cf" 'format-code
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
  ;; Switch between header and implementation
  "o" 'projectile-find-other-file
  ;; Generate a password
  ;; TODO: need to figure out how to capture output and insert into buffer
  ;;  or, just do the vim command?  Not sure how that works...
  ;;"g" 'generate-password
  "n" 'neotree-toggle
  "f" 'switch-to-buffer

  ;; set "prefix argument"
  ;; by default this is ctrl-u in emacs.  Since using evil, I unmapped
  ;; that so that scroll up worked.  Call this before calling functions
  ;; to get that functionality
  "u" 'universal-argument
  )

;; leader keys that are useful in visual mode
(my-leader-def
  :keymaps '(normal visual)

  ;; Reformat text (ported from vim config)
  ;; I like fill-paragraph better than vim's reformat (better suited to text)
  "p" 'fill-paragraph

  ;; comment stuff out
  ;; NOTE: comment-line can act as a toggle (opposed to comment-region)
  "cc" 'comment-line ;; "code: comment"
  )

;; TODO: submit this upstream to evil-collection
(general-define-key
  :states 'normal
  :keymaps 'ripgrep-search-mode-map

  "q" 'quit-window

  ;; TODO: others?  (Reference evil-collection-ag)
  )

;; Not sure where this would be submitted upstream since...
(general-define-key
  :states 'normal
  :keymaps 'diff-mode-map

  "s" 'diffstat
  )

;; TODO: submit this upstream
(general-define-key
  :states 'normal
  :keymaps 'diffstat-mode-map

  "<RET>" 'diffstat-goto-diff
  "q" 'diffstat-quit
  )

;; This overrides ispell binding...
;; Not sure if there's a better way to do this?
(general-define-key
  :states 'normal
  :keymaps 'flyspell-mode-map

  "z=" 'flyspell-correct-wrapper
  )

(use-package evil-collection
  :after evil
  :config
  ;; Nice that I can pick and choose
  ;; I was setting a lot of bindings for several of these
  (evil-collection-init '(
                          comint
                          company
                          compile
                          custom
                          diff-mode
                          dired
                          ediff
                          flymake
                          grep
                          ivy
                          kotlin
                          log-view
                          neotree
                          package-menu
                          profiler
                          vc-annotate
                          xref
                          ))
  ;; Others to consider: python, all?
  :custom
  ;; disable youcompleteme TAB/S-TAB functionality
  (evil-collection-company-use-tng nil)
  )
