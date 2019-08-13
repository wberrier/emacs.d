
;; mutt composition mode

;; visual marker for flowing messages
(use-package messages-are-flowing
  :init
  (add-hook 'message-mode-hook 'messages-are-flowing-use-and-mark-hard-newlines)
)

;; Redefine this to be able to put a space for soft newlines.
;; https://www.emacswiki.org/emacs/FormatFlowed
;; https://emacs.stackexchange.com/questions/19296/retooling-fill-paragraph-to-append-trailing-spaces
;; Still seems to work for refill mode, which is nice
;; would be nice to have a package that does this, but this will have to do for now

;; My version
(defun fill-newline-custom ()
  "Custom version of fill-newline to behave 3676ishly"

  ;; Replace whitespace here with one newline, then
  ;; indent to left margin.
  (skip-chars-backward " \t")
  (insert ?\s)
  (insert ?\n)
  ;; Give newline the properties of the space(s) it replaces
  (set-text-properties (1- (point)) (point)
					   (fill-text-properties-at (point)))
  (and (looking-at "\\( [ \t]*\\)\\(\\c|\\)?")
	   (or (aref (char-category-set (or (char-before (1- (point))) ?\000)) ?|)
		   (match-end 2))
	   ;; When refilling later on, this newline would normally not be replaced
	   ;; by a space, so we need to mark it specially to re-install the space
	   ;; when we unfill.
	   (put-text-property (1- (point)) (point) 'fill-space (match-string 1)))
  ;; If we don't want breaks in invisible text, don't insert
  ;; an invisible newline.
  (if fill-nobreak-invisible
	  (remove-text-properties (1- (point)) (point)
							  '(invisible t)))
  (if (or fill-prefix
		  (not fill-indent-according-to-mode))
	  (fill-indent-to-left-margin)
	(indent-according-to-mode))
  ;; Insert the fill prefix after indentation.
  (and fill-prefix (not (equal fill-prefix ""))
	   ;; Markers that were after the whitespace are now at point: insert
	   ;; before them so they don't get stuck before the prefix.
	   (insert-before-markers-and-inherit fill-prefix)))

(defun fill-newline-wrapper (orig-fun &rest args)
  "Call fill-newline[-custom] depending on mode"

  ;; TODO: customize this with variable?
  ;; NOTE: this is done so that it doesn't affect other modes
  (if (member major-mode messages-are-flowing-enhance-fill-newline-modes)
	  (progn ;; allow multiple statements
		 ;; Alter fill-newline
		 (fill-newline-custom)
		)
	(apply orig-fun args)
	)
  )

(defun messages-are-flowing-enhance-fill-newline ()
  "Function to enhance fill-newline, only for certain modes"
	(advice-add 'fill-newline :around #'fill-newline-wrapper)
	(turn-off-auto-fill)
  )

;; What's the difference between message-mode and post-mode?
;; * message-mode correctly quotes long lines when doing 'fill-paragraph

(use-package message-mode
  :ensure nil ;; built-in, don't download

  :mode "tmp/mutt*\\|\\.article|\\.followup"
  :mode "/tmp/evo*"

  :init

  ;; TODO: should probably be a defcustom
  ;; TODO: allow list
  (setq-default messages-are-flowing-enhance-fill-newline-modes '(message-mode))

  ;; Special settings for flowed messages
  ;; an addition to "messages-are-flowing"
  ;; TODO: add this to messages-are-flowing package
  (add-hook 'message-mode-hook 'messages-are-flowing-enhance-fill-newline)

  ;; don't show trailing whitespace in message mode
  ;; NOTE: honestly it's not clear why this has to be a mode hook
  ;; doesn't 'stick' otherwise
  (add-hook 'message-mode-hook (lambda () (setq show-trailing-whitespace nil)))

  ;; refil when writing paragraphs, finally!
  (add-hook 'message-mode-hook 'refill-mode)

  )

;(use-package post-mode
;  :mode "tmp/mutt*\\|\\.article|\\.followup"
;  :mode "/tmp/evo*"
;  )

(use-package mutt-mode
  :mode "muttrc"
  )
