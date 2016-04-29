
(add-to-list 'load-path (format "~/install/%s/share/emacs/site-lisp" dist))

(require 'doxymacs)

(add-to-list 'load-path "~/wa/git/markdown-mode")

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.dox\\'" . markdown-mode))
