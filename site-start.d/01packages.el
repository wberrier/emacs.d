;; Package initialization
(require 'package)
;; TODO: stable version?
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; list of packages to install

(defvar required-packages
  '(
    ; EViL! (vim)
    evil
    evil-numbers
    evil-leader
    evil-org
    clean-aindent-mode ; kill trailing whitespace because of inserts

    ; looks like only helm and magit used this
    async

    ; code complete packages
    company
    irony
    company-irony
    company-irony-c-headers

    ; various other modes
    yaml-mode
    markdown-mode

    ; various theme options
    ample-theme
    ;zenburn-theme
    ;base16-theme
    ;color-theme-solarized
    ;solarized-theme
    ;color-theme-sanityinc-tomorrow
    ;cyberpunk-theme
    ;moe-theme
    ;monokai-theme

    go-mode

    ; more go stuff
    ;company-go
    ;go-eldoc
    ;go-errcheck

    ;yasnippet
    )
  "a list of packages to install (if not present) at launch.")

; these require emacs 24.4 or later
(if (version<= emacs-version "24.4")
 nil
 ;; TODO: how to do this in one statement? (looks to be ugly)
 (add-to-list 'required-packages 'magit)
 (add-to-list 'required-packages 'helm)
 )

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

