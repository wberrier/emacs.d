
; Helm
(when (require 'helm-config nil 'noerror)
  (require 'helm-config)
  ; Override M-x with the helm version, very nice!
  (global-set-key (kbd "M-x") 'helm-M-x)
  (helm-mode 1)
  )

(projectile-global-mode)
(setq projectile-completion-system 'helm)
;(helm-projectile-on)

