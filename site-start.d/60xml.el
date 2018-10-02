;; Add support for "hiding" xml sections with hideshow minor mode

(add-hook 'nxml-mode-hook 'hs-minor-mode)

;; Regexes to support xml with hideshow
;; Surprised this isn't built in to hideshow?
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))

;; Nice keybinding in normal mode
;; NOTE: this is slightly different than org/markdown TAB key
;; this hides where the cursor is
(general-define-key :states 'normal :keymaps 'nxml-mode-map "TAB" 'hs-toggle-hiding)
