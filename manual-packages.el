;; these are for packages that are not installable, and must be done manually

;; TODO: create a list of stuff to genericize this?

(if (file-exists-p "~/.emacs.d/manual-packages")
    nil
  (make-directory "~/.emacs.d/manual-packages" t)
  )

;; Check for directories and checkout if they don't exist
;; TODO: is there a more standard version to this?
(if (file-exists-p "~/.emacs.d/manual-packages/my-site-start")
    nil
  (shell-command "git clone https://github.com/tripleee/my-site-start ~/.emacs.d/manual-packages/my-site-start")
  )

;;post-mode
(if (file-exists-p "~/.emacs.d/manual-packages/post-mode")
    nil
  (shell-command "git clone http://git.code.sf.net/p/post-mode/code ~/.emacs.d/manual-packages/post-mode")
  )

;; Make post-mode available
(add-to-list 'load-path "~/.emacs.d/manual-packages/post-mode")

;;qmake-mode
(if (file-exists-p "~/.emacs.d/manual-packages/qmake-mode")
    nil
  (shell-command "git clone https://github.com/inlinechan/qmake-mode.git ~/.emacs.d/manual-packages/qmake-mode")
  )
(add-to-list 'load-path "~/.emacs.d/manual-packages/qmake-mode")

;; mercural (mainly for commit mode)
(if (file-exists-p "~/.emacs.d/manual-packages/mercurial")
    nil
  (make-directory "~/.emacs.d/manual-packages/mercurial")
  (shell-command "wget https://www.mercurial-scm.org/repo/hg/raw-file/default/contrib/mercurial.el -O ~/.emacs.d/manual-packages/mercurial/mercurial.el")
  )
(add-to-list 'load-path "~/.emacs.d/manual-packages/mercurial")


;; Not sure these are necessary (if not in melpa, maybe not useful?)
;;evil-rebellion ; obsoleted by spacemacs.  Not sure if I need this any longer?
;;git-modes ; not sure if this is necessary?
;;doxymacs

