#!/usr/bin/env sh
exec /usr/bin/mutt -F ${XDG_CONFIG_HOME:-$HOME/.config}/mutt/muttrc $@
