;; Load various modes, with not much configuration

;; Protobuf syntax highlighting
(autoload 'protobuf-mode "protobuf-mode" "Major mode for editing protobuf defitinion." t)
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))

;; golang syntax highlighting
(autoload 'go-mode-load "go-mode-load" "Major mode for editing go source" t)
(add-to-list 'auto-mode-alist '("\\.go$" . go-mode-load))

; Only load this when it exists
(setq cmake-tab-width 4) ; 2 spaces is weird
(when (require 'cmake-mode nil 'noerror)
  (setq auto-mode-alist
	(append '(("CMakeLists\\.txt" . cmake-mode)
		  ("\\.cmake$" . cmake-mode))
		auto-mode-alist))
)

; don't fail if doesn't exist
; can slow down loading/saving files
;(when (require 'mercurial nil 'noerror))

; Enable some minor modes for text-mode
; NOTE: org and post modes derive from text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(add-to-list 'load-path "~/wa/git/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
