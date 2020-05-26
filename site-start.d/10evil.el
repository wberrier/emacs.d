
;; NOTE: tried a method of using forward-evil-symbol instead of forward-evil-word, but that's
;; not the same as vim, which I think is preferrable.
;; vim probably has it wrong (ie: too simplistic), but that's what we're emulating

(use-package evil
  :init

  ;; some coloring options, try them out and see if they are wanted
  ;; looks like they don't work in console mode
  (setq evil-emacs-state-cursor    '("red"    box))
  (setq evil-motion-state-cursor   '("orange" box))
  (setq evil-normal-state-cursor   '("green"  box))
  (setq evil-visual-state-cursor   '("orange" box))
  (setq evil-insert-state-cursor   '("red"    bar))
  (setq evil-replace-state-cursor  '("red"    bar))
  (setq evil-operator-state-cursor '("red"    hollow))

  ;; treat underscore as a word char, finally! (for 'w' and searching)
  ;;(modify-syntax-entry ?_ "w") ; NOTE: didn't work any longer?

  ;; Can't enable this for message-mode, emacs hangs...
  ;; Do this to enable for all modes except message-mode
  (add-hook 'change-major-mode-after-body-hook #'(lambda ()
    (if (equal major-mode 'message-mode)
        (modify-syntax-entry ?_ "_")
        (modify-syntax-entry ?_ "w")
        )))

  :custom
  ;; Make CTRL - u scroll up like I'm used to in vi
  ;; This seems to be off by default
  (evil-want-C-u-scroll t)
  (evil-search-module 'evil-search)

  ;; Use evil-collection instead
  (evil-want-integration t)
  (evil-want-keybinding nil)

  :config
  ;; Load evil by default
  (evil-mode 1)

  ;; call ibuffer instesad of 'list-buffers
  ;; originally tried getting evil-collection to work for
  ;; buffer-menu-mode, but it wasn't working, and I'm not quite sure why
  ;; just use ibuffer instead
  (evil-ex-define-cmd "buffers" 'ibuffer)

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

;; show tildes for lines that are not part of the file
;; apparently buggy though? We'll try it out...
;; NOTE: this supercedes "vi-tilde-fringe"
(use-package vim-empty-lines-mode
  :config
  ;; enable for all modes
  (global-vim-empty-lines-mode)
  )
