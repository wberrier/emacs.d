
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

;; Allow "RET" to work in gtags-select-mode when running under evil
(defun intercept-evil-ret ()
  (interactive) ;; huh?
  (if (eq major-mode 'gtags-select-mode) (gtags-select-tag) (evil-ret))
  )
(define-key evil-motion-state-map (kbd "RET") 'intercept-evil-ret)

; Other various keymaps

;; set up key combo to show whitespace chars
;; This was initially f10, but that's mapped to the menu, use f9
(define-key evil-normal-state-map (kbd "<f9>") 'whitespace-mode)

(defun bookmark-then-compile ()
  (interactive)
  (bookmark-set "compile-bookmark") ; set a bookmark to easily return to
  (compile compile-command) ; command set by the mode
  )
(define-key evil-normal-state-map (kbd "<f7>") 'bookmark-then-compile)
;(define-key evil-normal-state-map (kbd "<f7>") 'compile)

(defun jump-to-compile-bookmark ()
  (interactive)
  (bookmark-jump "compile-bookmark") ; set a bookmark to easily return to
  )
(define-key evil-normal-state-map (kbd "<f8>") 'jump-to-compile-bookmark)

;; Reformat text (ported from vim config)
;; I like fill-paragraph better than vim's reformat (better suited to text)
;; and I don't use "R" (replace) mode in vim apparently
(define-key evil-normal-state-map (kbd "R") 'fill-paragraph)

;; Switch between header and implementation
(define-key evil-normal-state-map (kbd "<f6>") 'ff-find-other-file)
