;; This doesn't seem to work to force command line entry
;;(setenv "GPG_AGENT_INFO" nil)

;; These seem to be enabled by default
;;(require 'epa-file)
;;(epa-file-enable)

;; On some versions of emacs the gpg2 pinentry was very problematic
;; One way to work around this is to use gpg1
;; But, on some systems (el7) /usr/bin/gpg is gpg2
;;(setq epg-gpg-program "/usr/bin/gpg")
;;; download compile and install gpg1 from https://www.gnupg.org/download/
;;(setq gpg1-path (format "%s/bin/gpg" local-install-dir))
;;(when(file-executable-p gpg1-path)
;;  (setq epg-gpg-program gpg1-path)
;;  )
;; The problem with this approach is that gpg1 saves the file in a format
;; that cannot be read by newer gpg2 versions unless an option to ignore mac
;; is enabled
;; -> just use gpg2 formats

;; With newer versions of emacs and gpg, you can set the pin entry
;; mode to 'loopback' when customizing the settings
;; until then, it seems to work best with no settings using gpg2
