;; Enable some minor modes for text-mode
;; NOTE: org and post modes derive from text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'refill-mode) ; refil when writing paragraphs, finally!
