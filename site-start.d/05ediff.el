
;; edif Settings
;; character level diffs
(setq-default ediff-forward-word-function 'forward-char)
;; split vertically by default instead of horizontally
(setq-default ediff-split-window-function 'split-window-horizontally)

;; don't prompt for quit
;; got this on stack overflow
(defun disable-y-or-n-p (orig-fun &rest args)
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
	(apply orig-fun args)))

(advice-add 'ediff-quit :around #'disable-y-or-n-p)
