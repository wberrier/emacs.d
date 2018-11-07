(use-package projectile

  :config
  (setq projectile-project-root-files-top-down-recurring
		(append '("compile_commands.json"
				  ".cquery"
				  ".emacs_project.json"
				  )
				projectile-project-root-files-top-down-recurring))

)
