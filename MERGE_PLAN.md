# Hyprland Config Merge Plan

## Goal
Keep your old keybindings and settings while adding dank linux quickshell UI support.

## Step 1: Backup and Restore Base Structure

1. **Restore the modular config structure:**
   ```bash
   # Backup the new dank config for reference
   cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.dank
   
   # Restore your old modular structure
   cp ~/.config/hypr/hyprland.conf.backup.2025-11-30_16-13-10 ~/.config/hypr/hyprland.conf
   ```

## Step 2: Update hyprland.conf with Dank Linux Integration

The old backup is missing the quickshell $qsConfig variable. Add at the top of `hyprland.conf`:

```bash
$qsConfig = ii  # This was in the dank config
```

Keep all your existing source statements.

## Step 3: Extract Critical Dank Linux Components

From the new dank config (`hyprland.conf.dank`), you need to add these to make quickshell work:

### A. In `hyprland/execs.conf` - Change line 3:
**OLD:** `exec-once = qs -c $qsConfig &`
**NEW:** `exec-once = dms run`

This is the dank linux shell daemon.

### B. Create `hyprland/dank-integration.conf`:
```conf
# Dank Linux quickshell layer rule
layerrule = noanim, ^(quickshell)$
```

### C. In main `hyprland.conf` - Add after other sources:
```conf
source=hyprland/dank-integration.conf
```

## Step 4: Update Keybindings

Your old keybinds are in `hyprland/keybinds.conf` (18KB, very comprehensive).
The dank config has simplified keybinds focused on `dms ipc` commands.

**DO NOT REPLACE your keybinds file.** Instead, ADD dank-specific bindings.

### Create `hyprland/dank-keybinds.conf`:
```conf
##! Dank Linux Shell
# Application Launchers via DMS
bind = Super, space, exec, dms ipc call spotlight toggle
bind = Super, V, exec, dms ipc call clipboard toggle  # NOTE: conflicts with your old V bind
bind = Super, M, exec, dms ipc call processlist toggle
bind = Super, comma, exec, dms ipc call settings toggle
# bind = Super, N, exec, dms ipc call notifications toggle  # Conflicts with your Super+N sidebar
bind = Super+Shift, N, exec, dms ipc call notepad toggle
bind = Super, Y, exec, dms ipc call dankdash wallpaper
# bind = Super, TAB, exec, dms ipc call hypr toggleOverview  # You already have Super+Tab for overview

# Audio via DMS
bindel = , XF86AudioRaiseVolume, exec, dms ipc call audio increment 3
bindel = , XF86AudioLowerVolume, exec, dms ipc call audio decrement 3
bindl = , XF86AudioMute, exec, dms ipc call audio mute
bindl = , XF86AudioMicMute, exec, dms ipc call audio micmute

# Brightness via DMS
bindel = , XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 ""
bindel = , XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5 ""

# Lock via DMS
bind = Super+Alt, L, exec, dms ipc call lock lock

# Keybinds cheatsheet
bind = Super+Shift, Slash, exec, dms ipc call keybinds toggle hyprland
```

### Source it in main config:
Add to `hyprland.conf` after your existing keybinds source:
```conf
source=hyprland/dank-keybinds.conf
```

## Step 5: Handle Keybind Conflicts

You have conflicts between old and new configs:

| Key | Old Function | New Function | Resolution |
|-----|--------------|--------------|------------|
| Super+V | Overview clipboard (end4) | DMS clipboard | **Use new dms one** |
| Super+M | Old: toggle media controls | New: DMS processlist | **Choose one** |
| Super+N | Old: Toggle right sidebar | New: DMS notifications | **Keep old, use Shift+N for notepad** |
| Super+Tab | Old: quickshell overview | New: dms overview | **Both do same thing, keep old** |

## Step 6: Update Environment Variables

Compare `hyprland.conf.dank` env section with your custom ones:

**Dank additions you might want:**
- `env = TERMINAL,kitty`
- `env = QT_QPA_PLATFORMTHEME,gtk3` (vs your `gnome`)

Add these to `custom/env.conf` if needed.

## Step 7: Update Startup Apps

In `hyprland/execs.conf`, replace:
```conf
exec-once = qs -c $qsConfig &
```

With:
```conf
exec-once = dms run
```

You also have mate-polkit in dank config vs kde/gnome polkit in old config. Choose which one you want.

## Step 8: Monitor Configuration

Your current `monitors.conf` has:
```conf
monitor=eDP-1,1920x1200@59.95,663x1152,1.5
monitor=DP-3,3840x2160@30.0,263x0,1.875
```

The dank config had a generic:
```conf
monitor = , preferred,auto,auto
```

**Keep your specific monitor config** - it's already correct.

## Step 9: Theme/Colors Update

The dank installation changed your colors in `hyprland/colors.conf`:
- Background: `131313` → `19120c` (darker brown tone)
- Active border: `919191` → `9e8e82` (brown-ish)
- Text colors updated

**Decision:** Do you want the new dank colors or your old ones?
- To keep old: `git checkout HEAD -- hyprland/colors.conf`
- To keep new: Do nothing (already updated)

## Step 10: Test and Validate

1. Reload Hyprland: `Ctrl+Super+R` or `hyprctl reload`
2. Test that:
   - Dank shell UI appears (quickshell bar)
   - Your old keybindings still work
   - New dms commands work (Super+Space, etc.)
   - Audio/brightness controls work
   - Wallpaper, notifications, etc. work

## Quick Command Summary

```bash
# 1. Backup dank config for reference
cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.dank

# 2. Restore old modular structure
cp ~/.config/hypr/hyprland.conf.backup.2025-11-30_16-13-10 ~/.config/hypr/hyprland.conf

# 3. Update execs for dank
sed -i 's|exec-once = qs -c $qsConfig &|exec-once = dms run|' ~/.config/hypr/hyprland/execs.conf

# 4. Add dank integration files (do this manually or with the commands below)
```

## Files to Manually Edit

1. `~/.config/hypr/hyprland.conf` - Add `$qsConfig = ii` at top, source dank files
2. `~/.config/hypr/hyprland/execs.conf` - Change `qs -c $qsConfig` to `dms run`
3. Create `~/.config/hypr/hyprland/dank-keybinds.conf` with new DMS bindings
4. Create `~/.config/hypr/hyprland/dank-integration.conf` with quickshell layer rule
5. Review and resolve keybind conflicts
