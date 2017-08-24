;; Various rtags settings

;; always go to list (TODO: is that correct?)
(setq rtags-jump-to-first-match nil)

;; suspend rtags when running compilation mode
(setq rtags-suspend-during-compilation t)

;; To help debug issues
(setq rtags-rc-log-enabled t)

;; keep original order of results
(setq rtags-sort-references-by-input t)

;; Don't close taglist
;; sometimes I wish it would stay open; let's try it out
(setq rtags-close-taglist-on-selection nil)

;; Reindex on save hook
;; shouldn't be necessary (should be using inotify)
;; but it seems to be required... ??  Not sure what's going on.
;; Happens both on ubuntu and redhat
;; Could it be it's only on large codebases?  Not sure...
(setq rtags-reindex-on-save t)

;; Completion settings
(setq rtags-autostart-diagnostics t)
(setq rtags-completions-enabled t)
