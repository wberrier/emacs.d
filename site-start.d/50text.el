
(use-package text-mode
  :ensure nil ;; built-in, don't attempt to download
  :config
  ;; Enable some minor modes for text-mode
  ;; NOTE: org and post modes derive from text mode
  (add-hook 'text-mode-hook 'turn-on-auto-fill)
  (add-hook 'text-mode-hook 'turn-on-flyspell)

  ;; Too invasive for all text modes
  ;; can enable for submodes as appropriate
  ;;(add-hook 'text-mode-hook 'refill-mode) ; refill when writing paragraphs, finally!
  )
