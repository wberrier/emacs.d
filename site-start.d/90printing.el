
(use-package lpr
  :ensure nil
  :custom
  ;; Check for lpr_wrapper and use it
  (lpr-command (if
                   (file-exists-p (format "%s/bin/lpr-wrapper" (getenv "HOME")))
                   (format "%s/bin/lpr-wrapper" (getenv "HOME"))
                 "lpr"))
  ;; Can do this to remove the -J and -T switches
  ;;(lpr-add-switches nil)
  )
