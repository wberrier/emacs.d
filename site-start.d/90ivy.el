
;; dependencies
;; NOTE: doesn't seem to require ":after"?
(use-package smex) ;; makes most frequent commands appear at top with 'counsel-M-x'

;; Used for searching buffers with ivy (like helm/swoop)
;; I may check it out at some point
;;(use-package swiper)

(use-package counsel)

;;(use-package counsel-projectile)

(use-package ivy
  :diminish (ivy-mode . "") ;; don't show in modeline

  :general
  ("M-x" 'counsel-M-x) ;; map M-x to counsel

  :config
  (ivy-mode 1)

  :custom
  (ivy-initial-inputs-alist nil) ;; clear input
  ;; increase size (any way to make this use the whole screen?  Like helm?)
  (ivy-height 20)

  ;; These are suggested by the maintainers
  (ivy-use-virtual-buffers t)
  (ivy-count-format "%d/%d ")

  ;; Fix Finding of files
  ;; I like this better than counsel-projectile
  (projectile-completion-system 'ivy)

  ;; grab current cursor item for input on projectile grep
  ;;(setq counsel-projectile-ag-initial-input '(ivy-thing-at-point))
  ;; I don't like counsel-projectile-ag interface, and setting the
  ;; completion sysetm to ivy fits my needs.
  ;;(counsel-projectile-mode)

  )
