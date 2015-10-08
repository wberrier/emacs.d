
; Helm
(add-to-list 'load-path "~/wa/git/emacs-async")
(add-to-list 'load-path "~/wa/git/helm")
(require 'helm-config)

; Override M-x with the helm version, very nice!
(global-set-key (kbd "M-x") 'helm-M-x)
