**GRUB**
    /etc/default/grub
        TIMEOUT=-1

**Network Manager**
    nmcli

**Graphics Drivers**
    lspci -k | grep -A 2 -E "(VGA|3D)"

**X11 Keyboard Layout**
    localectl set-x11-keymap gb
