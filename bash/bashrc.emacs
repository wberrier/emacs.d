
if ~/wa/hg/emacs.d/bin/flatpak-emacs-installed ; then
	alias emacs='flatpak run org.gnu.emacs'
	# TODO: doesn't work well
	alias emacsclient='flatpak run --command=emacsclient org.gnu.emacs'
fi

# Use emacs when available
if ~/wa/hg/emacs.d/bin/min-emacs-version ; then
	alias vim='~/wa/hg/emacs.d/bin/editor' # heh
fi

