;; Allow setting the directory of the package directory
(setq package-user-dir (format "~/.emacs.d/elpa-%s" local-dist))

;; Package initialization
(require 'package)
;; TODO: stable version?
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; list of packages to bootstrap use-package/general

(defvar required-packages
  '(
    ;; generic key bindings
    general

    ;; nice package management and configuration
    use-package
    diminish
    bind-key
    async ;; to run paradox in the background

    )
  "a list of packages to install (if not present) at launch.")

(require 'cl)

; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
    when (not (package-installed-p p)) do (return nil)
    finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; bootstrap use-package
(setq use-package-always-ensure t) ;; will force install packages when calling 'use-package'
(setq use-package-compute-statistics t)
(setq use-package-verbose t)
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key) ;; necessary?

;; manually require this since it provides functionality with use-package
(require 'general)

;; package interface
(use-package paradox
  :config
  (paradox-enable)
  )
