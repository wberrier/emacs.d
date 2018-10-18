
(use-package flyspell-mode
  :ensure nil ;; built-in, don't download

  :custom
  ;; Occasional use for norwegian dictionaries
  ;; (they have nynorsk, but not bokmål)
  ;; Honestly, the bokmål dictionary isn't that great
  ;; Run ispell-change-dictionary to select the norwegian one
  ;; Just use the gnome character map to insert chars, since the
  ;; norwegian dvorak layout can't insert 'ø' without a special
  ;; international keyboard.
  ;; TODO: use ispell-initialize-spellchecker-hook instead?
  (ispell-local-dictionary-alist '(("norwegian-bokmål"
									"[[:alpha:]]"
									"[^[:alpha:]]"
									"[']"
									t
									("-d" "nb_NO")
									;; This was required on debian
									;;("-d" "no")
									nil
									iso-8859-1))
								 )
  )
