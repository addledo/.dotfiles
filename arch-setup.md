**GRUB**
    /etc/default/grub
        TIMEOUT=-1

**Network Manager**
    nmcli
    nmtui  -  gui

**Graphics Drivers**
    lspci -k | grep -A 2 -E "(VGA|3D)"

**X11 Keyboard Layout**
    localectl set-x11-keymap gb

**Audio Setup**
    Install packages: pipewire-jack pipewire-alsa pipewire-pulse qjackctl
        Replace jack? yes

**Lid Close Behaviour**
    /etc/systemd/logind.conf
        HandleLidSwitch=ignore

**NVIDIA Info**
    nvidia-smi

**i3 Tray**
    https://i3wm.org/docs/userguide.html#_tray_output
    
**Brightness setup**
    Add user to video group:
        sudo usermod -aG video $USER
    Check groups: groups $USER
