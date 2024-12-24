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
  
**i3 Background**  
    Resize image -  
         convert <filename> -resize <resolution>! outputfile.png  
            ! forces resolution ignoring aspect ratio  
            (requires imagemagick)  
    Get screen resolution: xrandr  
    Combined:  
        convert <filename> -resize `xrandr | grep "*" | awk '{ print $1 }' | head -n 1`! outputfile.png  
  
**i3 Tray**  
    https://i3wm.org/docs/userguide.html#_tray_output  
      
**Brightness setup**  
    Add user to video group:  
        sudo usermod -aG video $USER  
    Check groups: groups $USER  
  
**Manually installed packages**  
    Put in /opt  
    Symlink to ~/.local/bin  
    ln -s source target  
  
**Switching win/alt keys and enabling compose key**  
    Add to /etc/default/keyboard
        XKBOPTIONS="altwin:swap_lalt_lwin, compose:paus"
    (Sets compose key to pause/break)
