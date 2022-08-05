
;; Various emacs settings

;; Visit the actual file when it's a symlink
;; Really this is for the compilation buffer to follow files
;; TODO: any drawbacks for doing this?
;; this is currently breaking emacs 28.1
;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=52292
(setq find-file-visit-truename nil)

;; avoid some compilation warnings, that force showing the warnings buffer...
(use-package warnings
  :ensure nil
  :custom
  (warning-suppress-types '((comp)))
)
