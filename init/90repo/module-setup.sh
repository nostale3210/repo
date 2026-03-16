#!/bin/bash

check() {
    if [[ -x "$systemdutildir"/systemd ]] && [[ -x /usr/libexec/repo-boot.sh ]]; then
        return 255
    fi

    return 1
}

depends() {
    echo bash systemd

    return 0
}

install() {
    inst_multiple /usr/libexec/repo-boot.sh \
        "$systemdsystemunitdir"/repo-boot.service \
        repo \
        move-mount

    $SYSTEMCTL -q --root "$initdir" enable repo-boot.service
}
