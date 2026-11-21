if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Aliases
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias paige 'cd /home/felix/Documents/GitHub/Paige'
    alias paige:wt 'cd /home/felix/Documents/GitHub/Paige.worktrees && ls -a'
    alias haven 'cd /home/felix/Documents/GitHub/haven'
    alias haven:wt 'cd /home/felix/Documents/GitHub/haven.worktrees && ls -a'
    alias hypr 'cd /home/felix/.config/hypr && ls -a'
    alias hypr:custom 'cd /home/felix/.config/hypr/custom && ls -a'
    alias github 'cd /home/felix/Documents/GitHub'
    alias vivaldi:css 'vim /home/felix/.config/vivaldi/css/custom.css'
    alias winapps:install 'curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh | bash'
    alias fish 'vim /home/felix/.config/fish/config.fish'
    alias fans 'sudo vim /etc/i8kutils/i8kmon.conf'
    alias cora 'ssh -L 18789:127.0.0.1:18789 "Felix Schäfer@192.168.0.112"'
    alias mm-102 'ssh -L 8501:127.0.0.1:8501 -L 8000:127.0.0.1:8000 "root@46.225.153.206"'
    alias packages 'pacman -Qem'
    alias services 'systemctl list-units --type=service'
    alias services:custom 'cd /etc/systemd/system/ && ls -a'
    alias services:gui 'cd ~/.config/systemd/user/ && ls -a'
    alias webapps 'cd ~/.local/share/applications/ && ls -a'
    alias fonts 'systemctl --user restart figma-agent.service'
    alias borgmatic:conf 'sudo vim /etc/borgmatic/config.yaml'
    alias rclone:conf 'sudo vim /root/.config/rclone/rclone.conf'
    alias backup 'sudo borgmatic --verbosity 1'
    alias drive 'systemctl start rclone-proton && cd /home/felix/Proton && ls -a'
    alias driveldm 'sudo ldmtool create volume d9fc95a0-b831-11ee-b8e8-001a7dda7115 Volume2'
    alias yayi '/home/felix/.config/yayinstall.sh'
    alias camera 'sudo modprobe v4l2loopback exclusive_caps=1 max_buffer=2 && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0'
    
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
fish_add_path $HOME/go/bin
