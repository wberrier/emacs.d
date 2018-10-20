
;; NOTE: tried a method of using forward-evil-symbol instead of forward-evil-word, but that's
;; not the same as vim, which I think is preferrable.
;; vim probably has it wrong (ie: too simplistic), but that's what we're emulating

(use-package evil
  :init
  ;; Make CTRL - u scroll up like I'm used to in vi
  ;; This seems to be off by default
  (setq evil-want-C-u-scroll t)
  (setq evil-search-module 'evil-search)

  ;; some coloring options, try them out and see if they are wanted
  ;; looks like they don't work in console mode
  (setq evil-emacs-state-cursor    '("red"    box))
  (setq evil-motion-state-cursor   '("orange" box))
  (setq evil-normal-state-cursor   '("green"  box))
  (setq evil-visual-state-cursor   '("orange" box))
  (setq evil-insert-state-cursor   '("red"    bar))
  (setq evil-replace-state-cursor  '("red"    bar))
  (setq evil-operator-state-cursor '("red"    hollow))

  ;; Use evil-collection instead
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)

  ;; treat underscore as a word char, finally! (for 'w' and searching)
  ;;(modify-syntax-entry ?_ "w") ; NOTE: didn't work any longer?

  ;; Can't enable this for message-mode, emacs hangs...
  ;; Do this to enable for all modes except message-mode
  (add-hook 'change-major-mode-after-body-hook #'(lambda ()
    (if (equal major-mode 'message-mode)
        (modify-syntax-entry ?_ "_")
        (modify-syntax-entry ?_ "w")
      )))

  :config
  ;; Load evil by default
  (evil-mode 1)

  ;; doesn't seem to be necessary?
  ;;general:
  ;; Indent after pressing return (like vim)
  ;;(:keymaps 'global-map "RET" 'newline-and-indent)
  )

;; vim increment/decrement
(use-package evil-numbers)

(use-package evil-org)

;; but don't leaving trailing whitespace on abandoned indents
;; Clean indent
(use-package clean-aindent-mode
  :config
  (clean-aindent-mode 1) ;; enable for all modes
  )

