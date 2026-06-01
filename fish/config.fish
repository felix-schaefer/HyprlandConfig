if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Aliases
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias paige 'cd /home/felix/Dokumente/GitHub/Paige'
    alias paige:wt 'cd /home/felix/Dokumente/GitHub/Paige.worktrees && ls'
    alias asterisk 'cd /home/felix/Dokumente/GitHub/Asterisk'
    alias hypr 'cd /home/felix/.config/hypr'
    alias hypr:custom 'cd /home/felix/.config/hypr/custom'
    alias github 'cd /home/felix/Dokumente/GitHub'
    alias vivaldi:css 'vim /home/felix/.config/vivaldi/css/custom.css'
    alias winapps:install 'curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh | bash'
    alias fish 'vim /home/felix/.config/fish/config.fish'
    alias fans 'sudo vim /etc/i8kutils/i8kmon.conf'
    alias cora 'ssh -L 18789:127.0.0.1:18789 "Felix Schäfer@192.168.0.112"'
    alias mm-102 'ssh -L 8501:127.0.0.1:8501 -L 8000:127.0.0.1:8000 "root@46.225.153.206"'
    alias packages 'octopi'
    alias fonts 'systemctl --user restart figma-agent.service'
    
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

function conda
    source /opt/anaconda/etc/fish/conf.d/conda.fish
    command conda $argv
end
