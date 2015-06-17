(require 'epa-file)
(epa-file-enable)

; things don't work right when calling out to pinentry...
; just bypass it
;(setenv "GPG_AGENT_INFO" nil)
