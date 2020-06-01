
;; Various emacs settings

;; Visit the actual file when it's a symlink
;; Really this is for the compilation buffer to follow files
;; TODO: any drawbacks for doing this?
(setq find-file-visit-truename t)

;; add function to be able to restart emacs
;; this should be alleviate the flow of change config, kill_emacs, start again...
;; although, not sure it works for my use case?
(use-package restart-emacs)
