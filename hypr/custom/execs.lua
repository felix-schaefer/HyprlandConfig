-- You can make apps auto-start here
-- exec-once has no direct keyword in Lua; subscribe to the session-start event instead.
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("kbuildsycoca6")
    hl.exec_cmd("valent --gapplication-service")
    -- hl.exec_cmd("/usr/bin/kdeconnectd")
    -- hl.exec_cmd("caps2esc -m 1")
end)

-- Für libadwaita GTK4 Apps kannst du diesen Befehl verwenden:
-- hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')   -- für GTK4 Apps
-- hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

-- Für GTK3 Apps musst du das adw-gtk3 Theme installieren (unter Arch Linux: sudo pacman -S adw-gtk-theme)
-- hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"')   -- für GTK3 Apps
