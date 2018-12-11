;; This doesn't seem to work to force command line entry
;;(setenv "GPG_AGENT_INFO" nil)

(use-package epa-file
  :ensure nil
  :init
  (epa-file-enable)
  )

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
;; give this another try
;;(setf epa-pinentry-mode 'loopback)
;; until then, it seems to work best with no settings using gpg2

;; TODO: how to fix password entry on ubuntu
;; TODO: probably works with a gui prompt, but doesn't work well when prompting from the command line (ubuntu)
;; https://unix.stackexchange.com/questions/55638/can-emacs-use-gpg-agent-in-a-terminal-at-all/278875#278875

(use-package epa
  :ensure nil
  :custom
  (epa-pinentry-mode 'loopback)
)

;; NOTE: the above doesn't seem to use this...
;; this probably isn't necessary...
(use-package epg
  :ensure nil
  :custom
  (epg-gpg-program "/usr/bin/gpg2")
  )

;; TODO: need to figure out how to get this working with ubuntu 16.04...
;; (loopback really is the best...)
