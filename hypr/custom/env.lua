-- You can put extra environment variables here
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XDG_SESSION_TYPE", "wayland")
-- hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
-- hl.env("XDG_CURRENT_DESKTOP", "GNOME")
-- hl.env("XDG_SESSION_DESKTOP", "Hyprland")
-- hl.env("XDG_SESSION_DESKTOP", "gnome")

-- hl.env("GTK_THEME", "adw-gt3")
-- hl.env("GTK_THEME", "Adwaita:dark")
-- hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1.25")
-- hl.env("QT_QPA_PLATFORMTHEME", "gnome")
hl.env("XDG_MENU_PREFIX", "gnome-")

-- ######## Terminal application #########
hl.env("TERMINAL", "kitty -1")
