;; Allow setting the directory of the package directory
(setq package-user-dir (format "~/.emacs.d/elpa-%s" local-dist))

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
    smooth-scrolling
    evil-ediff

    ; smart tabs and detection
    smart-tabs-mode
    dtrt-indent

    ; various other modes
    yaml-mode
    markdown-mode
    which-key

    neotree
    projectile
    ag

    ;; lsp
    lsp-mode
    lsp-ui
    company-lsp

    cquery
    lsp-python

    yasnippet
    projectile

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

    kotlin-mode
    flycheck-kotlin

    ;; java (ensime may also be able to be used for this)
    meghanada

    ;; scala
    ensime
    sbt-mode
    scala-mode

    flycheck-objc-clang

    ;; c# stuff
    csharp-mode
    omnisharp

    git-commit
    gitattributes-mode
    gitconfig-mode
    gitignore-mode
    git-timemachine
    git-messenger

    hgignore-mode
    hgrc-mode
    monky ;; 'magit' for hg

    ;; TODO (need to figure this out)
    use-package

    ;; email
    messages-are-flowing

    ;; Rust
    rust-mode
    racer ;; code completing, definition, etc...
    flycheck-rust
    cargo

    protobuf-mode

    qml-mode
    company-qml

    )
  "a list of packages to install (if not present) at launch.")

; these require emacs 24.4 or later
(if (version<= emacs-version "24.4")
 nil
 ;; TODO: how to do this in one statement? (looks to be ugly)
 (add-to-list 'required-packages 'helm)
 (add-to-list 'required-packages 'magit)
 (add-to-list 'required-packages 'evil-magit)
 )

; these require emacs 24.3 or later
(if (version<= emacs-version "24.3")
 nil
 ;; TODO: how to do this in one statement? (looks to be ugly)
 (add-to-list 'required-packages 'company)
 (add-to-list 'required-packages 'flycheck)
 (add-to-list 'required-packages 'meson-mode)
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

