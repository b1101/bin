#!/usr/bin/env sh
echo "\x$(echo ${1} | hexdump -C | head -1 | cut -d' ' -f3,4,5 | sed 's: :\\x:g')"
