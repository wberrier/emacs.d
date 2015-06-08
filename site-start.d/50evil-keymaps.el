
; Set up key bindings for gtags
(define-key evil-normal-state-map (kbd "\C-]") 'gtags-find-tag-from-here)
(define-key evil-normal-state-map (kbd "\C-t") 'gtags-pop-stack)

; Set up some keybindings for the cscope interaction
; although, it doesn't grab the current expression under the curson :(
; could write the equivalent "-from-here" functions...
; I guess this is where the shortcomings begin?
; but, it automatically puts the current symbol in the interactive buffer
; TODO: any way to automatically press enter?
; NOTE: not exactly sure what the difference is for some of these
(define-key evil-normal-state-map (kbd "\C-\\ s") 'gtags-find-symbol)
(define-key evil-normal-state-map (kbd "\C-\\ g") 'gtags-find-tag) ; different than gtags-find-tag-from-here! huh?
(define-key evil-normal-state-map (kbd "\C-\\ c") 'gtags-find-rtag)
(define-key evil-normal-state-map (kbd "\C-\\ t") 'gtags-find-pattern) ; same as gtags-find-with-grep
(define-key evil-normal-state-map (kbd "\C-\\ e") 'gtags-find-with-grep)
(define-key evil-normal-state-map (kbd "\C-\\ f") 'gtags-find-file)
;(define-key evil-normal-state-map (kbd "\C-\\ i") ')
;(define-key evil-normal-state-map (kbd "\C-\\ d") ')

; vim increment/decrement
(define-key evil-normal-state-map (kbd "\C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "\C-x") 'evil-numbers/dec-at-pt)

;; Allow "RET" to work in gtags-select-mode when running under evil
(defun intercept-evil-ret ()
  (interactive) ;; huh?
  (if (eq major-mode 'gtags-select-mode) (gtags-select-tag) (evil-ret))
  )
(define-key evil-motion-state-map (kbd "RET") 'intercept-evil-ret)

; Other various keymaps

;; set up key combo to show whitespace chars
(evil-leader/set-key "w" 'whitespace-mode)

; Some functions and and keymaps to compile code

; TODO: concatenating with compile-command ends up growing that command
; just hard code to cmake-build for now...
(defun bookmark-then-compile ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "cmake_build")
  )

(defun bookmark-then-compile-debug ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "cmake_build --build_dir=build-debug")
  )

(defun bookmark-then-compile-cross ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile "cmake_build --build_dir=build-cross")
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

;; Reformat text (ported from vim config)
;; I like fill-paragraph better than vim's reformat (better suited to text)
(evil-leader/set-key "p" 'fill-paragraph)

;; Switch between header and implementation
(evil-leader/set-key "o" 'ff-find-other-file)
