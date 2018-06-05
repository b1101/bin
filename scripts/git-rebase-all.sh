#!/usr/bin/env bash
set -e

base=${1:-master}
for b in $(git for-each-ref --no-contains "${base}" refs/heads --format '%(refname:lstrip=2)'); do 
    if ! git checkout -q "${b}" && git rebase -q "${base}" > /dev/null; then 
        echo "*** Failed to rebase ${b}"
        git rebase --abort
    fi
done

git checkout -q "${base}" && git branch --merged | grep -v '\*' | xargs -r git branch -d
