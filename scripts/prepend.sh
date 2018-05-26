#!/usr/bin/env bash
cmd="1i $1"
shift
for f in $@; do sed -i "$cmd" "$f"; done
