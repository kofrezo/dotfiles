eval $(ssh-agent)

if [ "$(tty)" = "/dev/tty1" ]; then
    # Required until: https://gitlab.freedesktop.org/drm/nouveau/-/issues/36
    export WLR_DRM_NO_MODIFIERS=1

    export XDG_SESSION_TYPE=wayland
    export XDG_SESSION_DESKTOP=sway
    export XDG_CURRENT_DESKTOP=sway
    export LIBSEAT_BACKEND=logind

    exec dbus-run-session -- sway $@ 2>&1 | logger -t sway ; exit
fi
