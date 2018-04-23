
;; Set executable path if expected environment variable is found
(if (equal (getenv "LOCAL_INSTALL_DIR") nil)
    nil
  (setq cquery-executable (format "%s/bin/cquery" (getenv "LOCAL_INSTALL_DIR")))
  )

(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
	(append '("compile_commands.json"
		  ".cquery")
		projectile-project-root-files-top-down-recurring)))


;; Enable lsp for all c/c++ modes
(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

  (use-package cquery
    :commands lsp-cquery-enable
    :init (add-hook 'c-mode-common-hook #'cquery//enable))
;; Also see lsp-project-whitelist lsp-project-blacklist cquery-root-matchers
