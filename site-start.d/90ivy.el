
;; dependencies
;; NOTE: doesn't seem to require ":after"?
(use-package smex) ;; makes most frequent commands appear at top with 'counsel-M-x'
(use-package swiper)
(use-package counsel)
(use-package counsel-projectile)

(use-package ivy
  :diminish (ivy-mode . "") ;; don't show in modeline

  :general
  ("M-x" 'counsel-M-x) ;; map M-x to counsel

  ;; evil: allow esc to exit minibuffer
  ;; this is a little odd to put here since all the other
  ;; evil keymaps are elsewhere.
  ;; hrm... ?  maybe that's why there's functions to show all keybindings?
  (:keymaps 'ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit)

  :config
  (ivy-mode 1)
  (counsel-projectile-mode)
  (setq ivy-initial-inputs-alist nil) ;; clear input

  )
