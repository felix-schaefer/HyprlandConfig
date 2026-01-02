if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Aliases
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias paige 'cd /home/felix/Dokumente/GitHub/Paige'
    alias paige:wt 'cd /home/felix/Dokumente/GitHub/Paige.worktrees'
    alias asterisk 'cd /home/felix/Dokumente/GitHub/Asterisk'
    alias hypr 'cd /home/felix/.config/hypr'
    alias hypr:custom 'cd /home/felix/.config/hypr/custom'
    alias github 'cd /home/felix/Dokumente/GitHub'
    alias vivaldi:css 'vim /home/felix/.config/vivaldi/css/custom.css'
    alias winapps:install 'curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh | bash'
    alias fish 'vim /home/felix/.config/fish/config.fish'
    alias fans 'sudo vim /etc/i8kutils/i8kmon.conf'
    alias packages 'octopi'
    
end
mise activate fish | source

# pnpm
set -gx PNPM_HOME "/home/felix/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

export LIBVIRT_DEFAULT_URI="qemu:///system"

neofetch
