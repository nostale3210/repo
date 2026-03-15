#!/bin/sh

type getarg >/dev/null 2>&1 || . /lib/dracut-lib.sh

[ -z "$1" ] && printf "No sysroot specified! Exiting!\n" && exit 0
sysroot="$1"

ald_boot=$(getarg repo.boot)
[ -z "$repo_boot" ] && printf "No deployment specified! Exiting!\n" && exit 0

mount -o remount,rw "$sysroot"

repo activate "$repo_boot" --rootd "$sysroot"
