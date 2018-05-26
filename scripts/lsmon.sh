#!/usr/bin/env bash
xrandr -q | grep " connected" | cut -d ' ' -f1
