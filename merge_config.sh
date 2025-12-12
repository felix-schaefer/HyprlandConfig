#!/bin/bash
# Hyprland Config Merge Script
# Restores old config structure and adds dank linux support

set -e

echo "=== Hyprland Config Merge Script ==="
echo "This will:"
echo "  1. Backup current dank config"
echo "  2. Restore your old modular config structure"
echo "  3. Update it to work with dank linux shell"
echo ""

# Backup current dank config
echo "[1/6] Backing up current dank config..."
cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.dank
echo "  ✓ Saved to hyprland.conf.dank"

# Restore old modular structure
echo "[2/6] Restoring old modular config structure..."
cp ~/.config/hypr/hyprland.conf.backup.2025-11-30_16-13-10 ~/.config/hypr/hyprland.conf
echo "  ✓ Restored from backup"

# Update execs.conf for dank
echo "[3/6] Updating hyprland/execs.conf for dank shell..."
sed -i 's|exec-once = qs -c \$qsConfig &|exec-once = dms run|' ~/.config/hypr/hyprland/execs.conf
echo "  ✓ Changed 'qs -c \$qsConfig' to 'dms run'"

# Create dank integration file
echo "[4/6] Creating hyprland/dank-integration.conf..."
cat > ~/.config/hypr/hyprland/dank-integration.conf << 'EOF'
# Dank Linux quickshell layer rule
layerrule = noanim, ^(quickshell)$
EOF
echo "  ✓ Created dank-integration.conf"

# Create dank keybinds file
echo "[5/6] Creating hyprland/dank-keybinds.conf..."
cat > ~/.config/hypr/hyprland/dank-keybinds.conf << 'EOF'
# Lines ending with `# [hidden]` won't be shown on cheatsheet
# Lines starting with #! are section headings

#!
##! Dank Linux Shell
# Application Launchers via DMS
bindd = Super, Space, Launch applications, exec, dms ipc call spotlight toggle # Launch applications
bindd = Super, Comma, Open settings, exec, dms ipc call settings toggle # Open settings
bind = Super+Shift, N, exec, dms ipc call notepad toggle # [hidden] Notepad
bind = Super, Y, exec, dms ipc call dankdash wallpaper # [hidden] Wallpaper selector

# Note: Super+V, Super+M conflicts handled - using your old bindings
# Note: Super+Tab conflicts - using your old overview toggle
# Note: Super+N conflicts - keeping your sidebar toggle

# Audio via DMS (overrides old wpctl bindings)
bindel = , XF86AudioRaiseVolume, exec, dms ipc call audio increment 3 # [hidden]
bindel = , XF86AudioLowerVolume, exec, dms ipc call audio decrement 3 # [hidden]
bindl = , XF86AudioMute, exec, dms ipc call audio mute # [hidden]
bindl = , XF86AudioMicMute, exec, dms ipc call audio micmute # [hidden]

# Brightness via DMS (overrides old brightnessctl bindings)
bindel = , XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 "" # [hidden]
bindel = , XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5 "" # [hidden]

# Keybinds cheatsheet via DMS
bind = Super+Shift, Slash, exec, dms ipc call keybinds toggle hyprland # [hidden]
EOF
echo "  ✓ Created dank-keybinds.conf with minimal conflicts"

# Update main hyprland.conf
echo "[6/6] Updating main hyprland.conf..."
# Create updated config with $qsConfig and new sources
cat > ~/.config/hypr/hyprland.conf << 'EOF'
# This file sources other files in `hyprland` and `custom` folders
# You wanna add your stuff in files in `custom`

$qsConfig = ii
exec = hyprctl dispatch submap global # DO NOT REMOVE THIS OR YOU WON'T BE ABLE TO USE ANY KEYBIND
submap = global # This is required for catchall to work

# Defaults
source=hyprland/env.conf
source=hyprland/execs.conf
source=hyprland/general.conf
source=hyprland/rules.conf
source=hyprland/colors.conf
source=hyprland/keybinds.conf

# Dank Linux integration
source=hyprland/dank-integration.conf
source=hyprland/dank-keybinds.conf

# Custom 
source=custom/env.conf
source=custom/execs.conf
source=custom/general.conf
source=custom/rules.conf
source=custom/keybinds.conf

# nwg-displays support
source=workspaces.conf
source=monitors.conf
EOF
echo "  ✓ Updated hyprland.conf with \$qsConfig and dank sources"

echo ""
echo "=== Merge Complete! ==="
echo ""
echo "Summary of changes:"
echo "  • Restored your old modular config structure"
echo "  • Added \$qsConfig = ii variable for dank shell"
echo "  • Changed shell daemon: 'qs' → 'dms'"
echo "  • Added layerrule for quickshell"
echo "  • Added dank-specific keybindings (avoiding conflicts)"
echo "  • Kept your old comprehensive keybindings"
echo ""
echo "Keybind changes:"
echo "  • Super+Space: now launches dank spotlight"
echo "  • Super+Comma: opens dank settings"
echo "  • Audio/Brightness keys: now use dms instead of wpctl/brightnessctl"
echo "  • Super+V, Super+M, Super+N, Super+Tab: KEPT YOUR OLD BINDINGS"
echo ""
echo "Next steps:"
echo "  1. Review the changes if needed"
echo "  2. Reload Hyprland: Ctrl+Super+R or 'hyprctl reload'"
echo "  3. Test that dank shell appears and works"
echo ""
echo "Files modified:"
echo "  • ~/.config/hypr/hyprland.conf"
echo "  • ~/.config/hypr/hyprland/execs.conf"
echo ""
echo "Files created:"
echo "  • ~/.config/hypr/hyprland/dank-integration.conf"
echo "  • ~/.config/hypr/hyprland/dank-keybinds.conf"
echo ""
echo "Backup saved as: ~/.config/hypr/hyprland.conf.dank"
