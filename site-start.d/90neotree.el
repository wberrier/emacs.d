
;; neotree integration
(use-package neotree)

;;(setq projectile-switch-project-action 'neotree-projectile-action)

;; Always open neotree to projectile root
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find projectile root."))))
