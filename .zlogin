eval $(ssh-agent)

if [ "$(tty)" = "/dev/tty1" ]; then
    # Required until: https://gitlab.freedesktop.org/drm/nouveau/-/issues/36
    export WLR_DRM_NO_MODIFIERS=1

    export XDG_SESSION_TYPE=wayland
    export XDG_SESSION_DESKTOP=sway
    export XDG_CURRENT_DESKTOP=sway
    export LIBSEAT_BACKEND=logind

    # Rotate log files to prevent running out of disk space
    test -f $HOME/.sway.log.1 && rm $HOME/.sway.log.1
    test -f $HOME/.sway.log && cp $HOME/.sway.log $HOME/.sway.log.1

    exec dbus-run-session -- sway $@ 2>&1 >> $HOME/.sway.log
fi
