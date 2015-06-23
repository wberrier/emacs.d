(require 'epa-file)
(epa-file-enable)

; ok, on some versions of emacs we need to use the old gpg in order to
; for terminal pin entries not to hang
; download compile and install gpg1 from https://www.gnupg.org/download/
(setq gpg1_path (format "~/install/%s/bin/gpg" dist))
(when(file-executable-p gpg1_path)
  (setq epg-gpg-program gpg1_path)
  )

