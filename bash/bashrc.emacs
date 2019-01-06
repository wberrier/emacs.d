
# default to vim
alias vi='vim'
alias realvim='/usr/bin/vim'
alias realgvim='/usr/bin/gvim'

if ~/wa/hg/emacs.d/bin/flatpak-emacs-installed ; then
	alias emacs='flatpak run org.gnu.emacs'
	# TODO: doesn't work well
	alias emacsclient='flatpak run --command=emacsclient org.gnu.emacs'
fi

# Use emacs when available
if ~/wa/hg/emacs.d/bin/min-emacs-version ; then
	alias vim='EMACS_CLI=1 ~/wa/hg/emacs.d/bin/editor' # heh
	alias gvim='~/wa/hg/emacs.d/bin/editor'
fi

