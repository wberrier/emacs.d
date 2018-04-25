
; 4 spaces indentation for shell mode
(add-hook 'sh-mode-hook (lambda ()
        (setq indent-tabs-mode nil
          tab-width 4
        )
      )
    )
