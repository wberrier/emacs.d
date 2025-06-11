(use-package ansible
  :init
  (add-hook 'yaml-mode-hook '(lambda () (ansible-mode 1)))
  (add-hook 'ansible-hook 'ansible-auto-decrypt-encrypt)
  (setq ansible-vault-password-file "~/.vault-pass")
  )


(use-package ansible-doc
  :init
  (add-hook 'yaml-mode-hook #'ansible-doc-mode)
  )

(use-package company-ansible
  :config
  (add-to-list 'company-backends 'company-ansible)
  )

(defun ansible-vault-mode-maybe ()
  (when (ansible-vault--is-encrypted-vault-file)
    (ansible-vault-mode 1)))

(use-package ansible-vault
  :init
  (add-hook 'yaml-mode-hook 'ansible-vault-mode-maybe)
  )

;; not sure how to configure this one? or if it's necessary?
;; (use-package poly-ansible
;;   )
