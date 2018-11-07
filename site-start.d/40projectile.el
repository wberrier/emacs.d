(use-package projectile

  :config
  ;; NOTE: this was taken from a cquery configuration guide
  ;; NOTE: this allows viewing subprojects from parent projects
  ;; but does not allow subprojects to see outer projects
  (setq projectile-project-root-files-top-down-recurring
		(append '("compile_commands.json"
				  ".cquery"
				  ".emacs_project.json"
				  )
				projectile-project-root-files-top-down-recurring))

)
