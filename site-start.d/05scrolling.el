
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
;; NOTE: this causes odd jumps with the lsp-ui-doc popup (which causes weird jumps with line wraps)
(use-package smooth-scrolling
  :custom
  ;;(smooth-scroll-margin 1) ; jumps when crossing wrapped lines
  ;;(smooth-scroll-margin 0) ; doesn't work at all
  (smooth-scroll-margin 2)
  (smooth-scroll-strict-margins t)

  :config
  (smooth-scrolling-mode 1)
  )
