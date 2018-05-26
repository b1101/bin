#!/usr/bin/env bash
shopt -s nullglob globstar

name=`2fa -list | rofi -dmenu`
[[ -n $name ]] || exit

case $1 in
    copy)
        2fa "$name" | xclip -sel clip;;
    insert)
        xdotool type --clearmodifiers "`2fa "$name" | head -1`";;
    new)
        rofi -dmenu | 2fa -add "$name"
esac
