hl.on("hyprland.start", function()
    hl.exec_cmd("swaync") -- notification
    hl.exec_cmd("nm-applet") -- nework manager
    hl.exec_cmd("awww-daemon") -- wallpaper
    hl.exec_cmd("waybar &") -- status bar
    hl.exec_cmd("pipewire") -- audio system
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
