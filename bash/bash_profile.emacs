
# Check if flatpak is installed
if ~/.emacs.d/bin/flatpak-emacs-installed ; then
	export EMACS_FLATPAK=1
fi

# Use emacs when available
if ~/.emacs.d/bin/min-emacs-version ; then
	export EDITOR="EMACS_CLI=1 $HOME/.emacs.d/bin/editor"
else
	export EDITOR="vim"
fi

