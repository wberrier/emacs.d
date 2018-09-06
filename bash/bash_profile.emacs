
# Check if flatpak is installed
if ~/wa/hg/emacs.d/bin/flatpak-emacs-installed ; then
	export EMACS_FLATPAK=1
fi

# Use emacs when available
if ~/wa/hg/emacs.d/bin/min-emacs-version ; then
	export EDITOR="$HOME/wa/hg/emacs.d/bin/editor"
else
	export EDITOR="vim"
fi

