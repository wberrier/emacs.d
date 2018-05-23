
;; 2 space tabs for javascript
(add-hook 'js-mode-hook
          (lambda ()
            ;; not working?
            (setq js-indent-level 2)
            (setq-default indent-tabs-mode nil)
            )
          )
