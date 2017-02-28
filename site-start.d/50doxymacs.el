
(add-to-list 'load-path (format "%s/share/emacs/site-lisp" local-install-dir))

; not currently compiling...
(require 'doxymacs)

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.dox\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
