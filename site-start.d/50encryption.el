
(use-package epa-file
  :ensure nil
  :init
  (epa-file-enable)
  )

;; Of all the ways to ask for a password, this seems to work the best
;; using pinentry-curses on emacs was very problematic in missing key strokes
;; I tried setting environment variables to force command line entry,
;; but that didn't work either
(use-package epa
  :ensure nil
  :custom
  (epa-pinentry-mode 'loopback)
)

;; Be sure to use gpg2 and related formats
;; The problem with gpg1 is that it saves the file in a format that
;; cannot be read by newer gpg2 versions unless an option to ignore
;; mac is enabled
;; -> just use gpg2 formats
;; NOTE: epa doesn't seem to use this setting
;; and is probably not necessary...
(use-package epg
  :ensure nil
  :custom
  (epg-gpg-program "/usr/bin/gpg2")
  )
