#!/usr/bin/env bash
exec rclone mount \
--read-only \
--acd-templink-threshold 0 \
--stats 1s \
--buffer-size 1G --timeout 5s --contimeout 5s -v \
--log-file /tmp/rclone.log $@
