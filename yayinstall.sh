#!/bin/bash
# yayinstall.sh — edit your custom package list in $EDITOR, then install/remove
# only what changed between the old and new version of the file.
#
# This never touches anything outside this file's own history — base/
# preinstalled packages are never considered, since we diff the file
# against itself, not against `pacman -Qe`.

set -uo pipefail

PKGLIST="${PKGLIST:-$HOME/.config/yayinstall.txt}"
BACKUP="$(mktemp)"
EDITOR="${EDITOR:-vim}"
HELPER="${AUR_HELPER:-yay}"   # falls back to pacman below if not found

# Make sure the file exists so first run doesn't error
touch "$PKGLIST"

# Snapshot current state before editing
cp "$PKGLIST" "$BACKUP"

# Edit
"$EDITOR" "$PKGLIST"

# Normalize both versions: strip blank lines/comments, dedupe, sort
old_pkgs="$(grep -vE '^\s*(#|$)' "$BACKUP" | sort -u)"
new_pkgs="$(grep -vE '^\s*(#|$)' "$PKGLIST" | sort -u)"

to_remove="$(comm -23 <(echo "$old_pkgs") <(echo "$new_pkgs"))"
to_add="$(comm -13 <(echo "$old_pkgs") <(echo "$new_pkgs"))"

rm -f "$BACKUP"

if [[ -z "$to_add" && -z "$to_remove" ]]; then
    echo "No changes to package list."
    exit 0
fi

# Pick installer: yay if available (handles AUR + repo), else pacman
if ! command -v "$HELPER" &>/dev/null; then
    HELPER="sudo pacman"
fi

if [[ -n "$to_add" ]]; then
    echo "Installing:"
    echo "$to_add" | sed 's/^/  + /'
    # shellcheck disable=SC2086
    $HELPER -S --needed $to_add
fi

if [[ -n "$to_remove" ]]; then
    echo "Removing:"
    echo "$to_remove" | sed 's/^/  - /'
    # shellcheck disable=SC2086
    sudo pacman -Rns $to_remove
fi
