
# priority: package emacs, flatpak emacs, vim
emacs_editor="env EMACS_CLI=1 $HOME/.emacs.d/bin/editor"
if ~/.emacs.d/bin/min-emacs-version ; then
	export EDITOR="$emacs_editor"
elif ~/.emacs.d/bin/flatpak-emacs-installed ; then
	export EDITOR="$emacs_editor"
	export EMACS_FLATPAK=1
else
	export EDITOR="vim"
fi

