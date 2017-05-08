
;; Don't fail if can't find
(when (require 'doxymacs nil 'noerror)
  )

(add-to-list 'auto-mode-alist '("\\.dox\\'" . markdown-mode))
