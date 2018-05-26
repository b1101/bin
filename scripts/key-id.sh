#!/usr/bin/env sh
gpg -K --keyid-format short | head -3 | tail -1 | cut -d '/' -f 2| cut -d ' ' -f 1 | tr -d [[:space:]]
