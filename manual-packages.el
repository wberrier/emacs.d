;; these are for packages that are not installable, and must be done manually

;; TODO: is there a more standard way to do manual packages?

;; use some common lisp for argument parsing
(require 'cl-lib)

(setq manual-packages-dir "~/.emacs.d/manual-packages")

(unless (file-exists-p manual-packages-dir)
  (make-directory manual-packages-dir t)
  )

(cl-defun manual-package (&key name git url)
  "define a manual package, either git repo or url"

  ;; TODO: do some error checking
  ;; (unless name
  ;;   (error "must pass at least :name"))

  ;; Check for directories and run command if they don't exist
  (setq package-path (format "%s/%s" manual-packages-dir name))

  (unless (file-exists-p package-path)
    (when git
      (shell-command (format "git clone %s %s" git package-path))
      )
    (when url
      (make-directory package-path t)
      (shell-command (format "wget --no-verbose %s -O %s/%s" url package-path (file-name-nondirectory url)))
      )
    )
  )

(manual-package
 :name "mercurial"
 :url "https://www.mercurial-scm.org/repo/hg/raw-file/default/contrib/mercurial.el"
 )

(manual-package
 :name "diffstat"
 :url "http://www.emacswiki.org/emacs/download/diffstat.el"
 )

(manual-package
 :name "my-site-start"
 :git "https://github.com/tripleee/my-site-start")

;; post-mode
(manual-package
 :name "post-mode"
 :git "http://git.code.sf.net/p/post-mode/code")

;; qmake-mode
(manual-package
 :name "qmake-mode"
 :git "https://github.com/inlinechan/qmake-mode")

(manual-package
 :name "vim-empty-lines-mode"
 :git "https://github.com/hchbaw/vim-empty-lines-mode")

;; Not sure these are necessary (if not in melpa, maybe not useful?)
;;evil-rebellion ; obsoleted by spacemacs.  Not sure if I need this any longer?
;;git-modes ; not sure if this is necessary?
;;doxymacs

