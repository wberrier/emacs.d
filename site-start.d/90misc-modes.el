;; Load various modes, with not much configuration

;; Protobuf syntax highlighting
(autoload 'protobuf-mode "protobuf-mode" "Major mode for editing protobuf defitinion." t)
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))

;; golang syntax highlighting
(autoload 'go-mode-load "go-mode-load" "Major mode for editing go source" t)
(add-to-list 'auto-mode-alist '("\\.go$" . go-mode-load))

;; git-modes: https://github.com/magit/git-modes
(add-to-list 'load-path "~/wa/git/git-modes")
(require 'gitattributes-mode)
(require 'git-commit-mode)
(require 'gitconfig-mode)
(require 'gitignore-mode)
; (require 'git-rebase-mode) ;; doesn't work well with evil

; Only load this when it exists
(when (require 'cmake-mode nil 'noerror)
  (setq auto-mode-alist
	(append '(("CMakeLists\\.txt" . cmake-mode)
		  ("\\.cmake$" . cmake-mode))
		auto-mode-alist))
)

; don't fail if doesn't exist
(when (require 'mercurial nil 'noerror))
