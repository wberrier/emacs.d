;;(require 'epa-file) ; seems to be loaded already?
(epa-file-enable)

; ok, on some versions of emacs we need to use the old gpg in order to
; for terminal pin entries not to hang
(setq epg-gpg-program "/usr/bin/gpg")

; download compile and install gpg1 from https://www.gnupg.org/download/
(setq gpg1-path (format "%s/bin/gpg" local-install-dir))
(when(file-executable-p gpg1-path)
  (setq epg-gpg-program gpg1-path)
  )
