
# default to vim
alias vi='vim'
alias realvim='/usr/bin/vim'
alias realgvim='/usr/bin/gvim'

# priority: package emacs, flatpak emacs, vim
emacs_editor="env EMACS_CLI=1 $HOME/.emacs.d/bin/editor"
if ~/.emacs.d/bin/min-emacs-version; then
	alias vim='EMACS_CLI=1 ~/.emacs.d/bin/editor' # heh
	alias gvim='~/.emacs.d/bin/editor'
elif ~/.emacs.d/bin/flatpak-emacs-installed; then
	alias emacs='EMACS_CLI=1 ~/.emacs.d/bin/editor'
	alias emacsclient='EMACS_CLI=1 ~/.emacs.d/bin/editor'

	alias vim='EMACS_CLI=1 ~/.emacs.d/bin/editor' # heh
	alias gvim='~/.emacs.d/bin/editor'
fi
