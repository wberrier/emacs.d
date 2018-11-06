
(use-package xref
  :ensure nil ;; don't install if it's missing, since it requires emacs 25.1
  :custom
  ;; don't prompt for identifiers
  (xref-prompt-for-identifier (quote (not xref-find-definitions xref-find-definitions-other-window xref-find-definitions-other-frame xref-find-references)))
  )

(defun compare--underscore-last (x y)
  (cond
   ((and (string-prefix-p "_" x)
         (not (string-prefix-p "_" y)))
    nil)
   ((and (string-prefix-p "_" y)
         (not (string-prefix-p "_" x)))
    t)
   (t (string-lessp x y))))

(defun company-transform-underscore-last (candidates)
  "Put stuff starting with underscore last completion list
 ordering.  Helpful for c++ and python.

 See `company-transformers'."
  (seq-sort-by 'company-strip-prefix 'compare--underscore-last
               candidates))

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)

  :custom

  ;; disable company mode when running gdb
  (company-global-modes '(not gud-mode))

  ;; set timeout to zero so that completion pops up instantly
  ;; hrm... doesn't really seem to do anything...
  ;; This seems to help with irony, but not with rtags
  (company-idle-delay .1)

  ;; Put underscore last in the list
  ;; https://emacs.stackexchange.com/questions/12360/how-to-make-private-python-methods-the-last-company-mode-choices
  ;; TODO: only do based on language?
  (company-transformers (quote (company-transform-underscore-last)))

  ;; be able to wrap completion list
  (company-selection-wrap-around t)

  :general
  ;; Make enter do a newline
  ;; otherwise, I may want to type something, it happens to match, but
  ;; enter selects my match
  ;; (This happens quite a bit in text mode)
  (:keymaps 'company-active-map "RET" nil)

  ;; also allow tab to complete selection
  ;; some people like the ycm mode where tab/backtab go forwards and backwards
  ;; TODO: need to intercept tab for completion when filling out
  ;; completed function parameters
  (:keymaps 'company-active-map "TAB" 'company-complete-selection)

  ;; ctrl-space
  ;; show all completions (initiate completions when no text yet)
  (:keymaps 'global-map "C-@" nil) ;; required to allow C-SPC below
  (:states 'insert :keymaps 'company-mode-map "C-SPC" 'company-complete-common)

  ;; Typically package loading is deferred if bindings are specified
  ;; this forces it to load
  :demand
  )

;; custom yasnippet backend from
;; https://github.com/company-mode/company-mode/issues/840
(defun company-yasnippet-unless-member-access (command &optional arg &rest ignore)
  (if (eq command 'prefix)
      (let ((prefix (company-yasnippet 'prefix)))
        (and prefix
             (save-excursion
               (forward-char (- (length prefix)))
               ;;(not (looking-back (rx (or "." "->")) (line-beginning-position))))
               ;; TODO: put these in a variable?  based on language?
               (not (looking-back (rx (or "." "->" "::")) (line-beginning-position))))
             prefix))
    (company-yasnippet command arg)))

(use-package company-lsp
  :init

  :custom
  ;; disable company caching, as server is faster (recommended in lsp documentation)
  ;; async completion
  (company-lsp-async t)
  (company-lsp-cache-candidates nil)
  ;; Should help with c++ std:: type completions
  (company-lsp-enable-recompletion t)

  :config
  ;; This merges snippets, but use the custom backend so that snippets
  ;; aren't shown when doing trigger completions
  ;; https://github.com/company-mode/company-mode/issues/485
  ;; https://github.com/company-mode/company-mode/issues/840
  ;; :separate put yasnippets at the bottom of the list for trigger characters
  (push '(:separate company-lsp :with company-yasnippet-unless-member-access) company-backends)
  )

(use-package company-qml
  :config
  (push 'company-qml company-backends)
  )

