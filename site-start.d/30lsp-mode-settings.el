
;; Set executable path if expected environment variable is found
(if (equal (getenv "LOCAL_INSTALL_DIR") nil)
    nil
  (setq cquery-executable (format "%s/bin/cquery" (getenv "LOCAL_INSTALL_DIR")))
  )

;; TODO: use $HOME environment variable
(setq cquery-extra-args '("--log-file=/home/wberrier/.cq.log"))

(setq cquery-cache-dir (format "%s/.cquery_cached_index" (getenv "HOME")))

;; specify loading subprojects?
;; TODO: can this be used to find build*/compile_commands.json?
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


;; Enable lsp-ui
(require 'lsp-ui)
(require 'lsp-ui-peek)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'c-mode-common-hook 'flycheck-mode)

;; Should help with c++ std:: type completions
(setq company-lsp-enable-recompletion t)

(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

