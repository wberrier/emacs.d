
# Upstream

https://github.com/zoglesby/emacs.flatpak

which is then posted to flathub

# Things that don't work

* server/client mode when running with "-nw" (ie: console)
  * TODO: what about the systemd daemon method?
* running emacs version check from bash (ubuntu only)
* Debugging (something about unable to disable address randomization)

## Missing from sandbox

Probably a lot of things here, this may be the biggest deterrant

* ripgrep
* ispell dictionary files
* Building (app would need dev environment inside sandbox)



