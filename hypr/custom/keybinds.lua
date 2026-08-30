-- See https://wiki.hypr.land/Configuring/Basics/Binds/
-- and https://wiki.hypr.land/Configuring/Basics/Dispatchers/

----! Utilities

hl.bind("SUPER + L", hl.dsp.exec_cmd("dms ipc call lock lock"))

-- Recording stuff
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("~/.config/scripts/record.sh"),
    { description = "Record region (no sound)" })
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("~/.config/scripts/record.sh --fullscreen"),
    { description = "Record screen (no sound)" })
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("~/.config/scripts/record.sh --fullscreen-sound"),
    { description = "Record screen (with sound)" })


----! Window

-- Focusing
hl.bind("SUPER + left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "d" }))

hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

hl.bind("ALT + F4", hl.dsp.window.close())          -- Close (Windows)
hl.bind("SUPER + Delete", hl.dsp.window.close())    -- Close
hl.bind("SUPER + Escape", hl.dsp.window.close())    -- Close
hl.bind("SUPER + Q", hl.dsp.window.close())         -- Close
hl.bind("SUPER + SHIFT + ALT + Q", hl.dsp.exec_cmd("hyprctl kill")) -- Forcefully zap a window

hl.bind("SUPER + CTRL + left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "r+1" }))

hl.bind("SUPER + CTRL + 1", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + CTRL + 2", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + CTRL + 3", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + CTRL + 4", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + CTRL + 5", hl.dsp.focus({ workspace = 10 }))

-- Window split ratio (binde -> repeating = true, fires while held)
hl.bind("SUPER + ALT + left", hl.dsp.layout("splitratio -0.1"), { repeating = true })
hl.bind("SUPER + ALT + right", hl.dsp.layout("splitratio +0.1"), { repeating = true })
hl.bind("SUPER + M", hl.dsp.layout("togglesplit"), { repeating = true })

-- #bind = Super+Shift, 1-5, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent N
-- (left commented out, same as original)

hl.bind("CTRL + SUPER + SHIFT + right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind("CTRL + SUPER + SHIFT + left", hl.dsp.window.move({ workspace = "r-1" }))

hl.bind("SUPER + CTRL + SHIFT + 1", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + CTRL + SHIFT + 2", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + CTRL + SHIFT + 3", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + CTRL + SHIFT + 4", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + CTRL + SHIFT + 5", hl.dsp.window.move({ workspace = 10 }))


----! Apps

hl.bind("SUPER + Return", hl.dsp.exec_cmd(
    '~/.config/scripts/launch_first_available.sh "${TERMINAL}" "kitty -1" "foot" "alacritty" "wezterm" "konsole" "kgx" "uxterm" "xterm"'
)) -- Terminal

hl.bind("SUPER + E", hl.dsp.exec_cmd(
    '~/.config/scripts/launch_first_available.sh "nautilus" "dolphin" "nemo" "thunar" "${TERMINAL}" "kitty -1 fish -c yazi"'
)) -- File manager

hl.bind("SUPER + K", hl.dsp.exec_cmd("gtk-launch WebApp-NotionCalendar9977"))
hl.bind("SUPER + J", hl.dsp.exec_cmd("gtk-launch WebApp-Notion0667"))

hl.bind("SUPER + W", hl.dsp.exec_cmd(
    '~/.config/scripts/launch_first_available.sh "vivaldi" "google-chrome-stable" "zen-browser" "firefox" "brave" "chromium" "microsoft-edge-stable" "opera" "librewolf"'
)) -- Browser

hl.bind("SUPER + C", hl.dsp.exec_cmd(
    '~/.config/scripts/launch_first_available.sh "code" "codium" "cursor" "zed" "zedit" "zeditor" "kate" "gnome-text-editor" "emacs" "command -v nvim && kitty -1 nvim" "command -v micro && kitty -1 micro"'
)) -- Code editor

hl.bind("SUPER + I", hl.dsp.exec_cmd(
    'XDG_CURRENT_DESKTOP=gnome ~/.config/scripts/launch_first_available.sh "gnome-control-center" "qs -p ~/.config/quickshell/$qsConfig/settings.qml" "systemsettings" "better-control"'
)) -- Settings app
