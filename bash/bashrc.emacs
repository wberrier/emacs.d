
# default to vim
alias vi='vim'
alias realvim='/usr/bin/vim'
alias realgvim='/usr/bin/gvim'

if ~/.emacs.d/bin/flatpak-emacs-installed ; then
	alias emacs='flatpak run org.gnu.emacs'
	# TODO: doesn't work well
	alias emacsclient='flatpak run --command=emacsclient org.gnu.emacs'
fi

# Use emacs when available
if ~/.emacs.d/bin/min-emacs-version ; then
	alias vim='EMACS_CLI=1 ~/.emacs.d/bin/editor' # heh
	alias gvim='~/.emacs.d/bin/editor'
fi

