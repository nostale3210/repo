#!/usr/bin/env bash

mkdir -p /var/tmp
KVER="$(ls /usr/lib/modules)"
dracut --no-hostonly --kver "$KVER" --reproducible \
    -f "/usr/lib/modules/$KVER/initramfs.img"
echo "Bye! :D"
