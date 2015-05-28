
;; gnu global setup
;; NOTE: keep the cscope vim keyboard bindings so I can still move between the two
;; note: there's also xcscope.el, which some say they like the best.  There's also ggtags.el.
(setq dist (substring (shell-command-to-string "~/bin/get_dist") 0 -1)) ; removes trailing newline
(add-to-list 'load-path (format "~/install/%s/share/gtags" dist))

(setq gtags-auto-update t) ; update files on save

(autoload 'gtags-mode "gtags" "" t)

;; look in evil-keymaps.el for shortcuts to call gtags functions
