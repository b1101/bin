#!/usr/bin/env bash
shopt -s nullglob globstar

prefix=${PASSWORD_STORE_DIR-$HOME/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

password=`printf '%s\n' "${password_files[@]}" | rofi -dmenu` #"$@"`

[[ -n $password ]] || exit

case $1 in
    copy)
        pass -c "$password";;
    insert)
        xdotool type --clearmodifiers "`pass show "$password" | head -1`";;
    new)
        pass generate -cn "$password" 20 ;;
esac
