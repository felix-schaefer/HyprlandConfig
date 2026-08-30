if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Aliases
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias paige 'cd /home/felix/Documents/GitHub/Paige'
    alias paige:wt 'cd /home/felix/Documents/GitHub/Paige.worktrees && ls -a'
    alias haven 'cd /home/felix/Documents/GitHub/Haven'
    alias haven:wt 'cd /home/felix/Documents/GitHub/Haven.worktrees && ls -a'
    alias hypr 'cd /home/felix/.config/hypr && ls -a'
    alias hypr:custom 'cd /home/felix/.config/hypr/custom && ls -a'
    alias github 'cd /home/felix/Documents/GitHub'
    alias vivaldi:css 'vim /home/felix/.config/vivaldi/css/custom.css'
    alias winapps:install 'curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh | bash'
    alias fish 'vim /home/felix/.config/fish/config.fish'
    alias fans 'sudo vim /etc/i8kutils/i8kmon.conf'
    alias cora 'ssh -L 18789:127.0.0.1:18789 "Felix Schäfer@192.168.0.112"'
    alias mm-102 'ssh -L 8501:127.0.0.1:8501 -L 8000:127.0.0.1:8000 "root@46.225.153.206"'
    alias packages 'pacman -Qm'
    alias services 'systemctl list-units --type=service'
    alias services:custom 'cd /etc/systemd/system/ && ls -a'
    alias services:gui 'cd ~/.config/systemd/user/ && ls -a'
    alias webapps 'cd ~/.local/share/applications/ && ls -a'
    alias fonts 'systemctl --user restart figma-agent.service'
    alias borgmatic:conf 'sudo vim /etc/borgmatic/config.yaml'
    alias rclone:conf 'sudo vim /root/.config/rclone/rclone.conf'
    alias backup 'sudo borgmatic --verbosity 1'
    alias drive 'systemctl start rclone-proton && cd /home/felix/Proton && ls -a'
    
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
export PATH="$HOME/.local/bin:$PATH"
