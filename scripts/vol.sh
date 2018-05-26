#!/usr/bin/env sh
set -e

if [ "$1" = "mute" ];then
    amixer -q set Master toggle
    sound=$(amixer sget Master | awk -F '[][]' '{ print $4 }' | tail -1)
    if [ $sound = "on" ]; then
        notify-send -t 1 -u low "Unmuted"
    else
        notify-send -t 1 -u low "Muted"
    fi
    exit 0
elif [ "$1" = "down" ];then
    amixer -q set Master ${2:-"5"}"%-"
    decreased="decreased"
elif [ "$1" = "up" ];then
    amixer -q set Master ${2:-"5"}"%+"
elif [ "$1" = "get" ];then
    echo $(amixer sget Master | awk -F '[][]' '{ print $2 }' | tail -1)
fi

volumenow=$(amixer sget Master | awk -F '[][]' '{ print $2 }' | tail -1)
notify-send -t 1 -u low "volume ${decreased:-"increased"} to $volumenow"
exit 0

