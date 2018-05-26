#!/usr/bin/env bash
set -e

[ -z "${1}" ] && { echo "Usage: $0 <host> [commands...]"; exit 1; }

target=$1
shift

ssh-copy-id root@${target}
scp -r ~/.dotfiles root@${target}:dotfiles
ssh root@${target} $@
