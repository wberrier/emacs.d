
;; mutt composition mode

;; visual marker and formatting for flowing messages
(use-package messages-are-flowing
  :init

  (add-hook 'message-mode-hook 'messages-are-flowing-use-and-mark-hard-newlines)

  ;; Special settings for flowed messages
  ;; an addition to "messages-are-flowing"
  (add-hook 'message-mode-hook 'messages-are-flowing-enhance-fill-newline)

  :custom (messages-are-flowing-enhance-fill-newline-modes '(message-mode))
)

;; What's the difference between message-mode and post-mode?
;; * message-mode correctly quotes long lines when doing 'fill-paragraph

(use-package message-mode
  :ensure nil ;; built-in, don't download

  :mode "tmp/mutt*\\|\\.article|\\.followup"
  :mode "/tmp/evo*"

  :init

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

