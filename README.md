#Introduction:
I found unattended-upgrades script quite clunky. Reboot/shutdown kills GDM, but it is restarted by the script, and you are not notified that the update will be happening and you have no easy way to prevent the update once it is prepared.  
I created this quick script to have PackageKit provided auto update with notifications and Gnome support on Debian (unlike the unattended-upgrades python script). This way automatic upgrades will function similarly to Fedora or Opensuse(using PackageKit).

#Requirements
**Dependencies: gnome-packagekit packagekit-tools dconf-editor libnotify-bin plymouth (will be installed by install.sh)**
**Splash kernel parameter (and recommended quiet)**
*With grub:*
https://wiki.archlinux.org/title/GRUB
https://wiki.debian.org/Grub

*With standard systemdboot setup:*
add splash and quiet to cmdline, example:
cat /etc/kernel/cmdline
root=UUID=12345 ro quiet splash
#Install

#Warning:

**Use it at your own risk. I don't take responsiblity for borked systems/bootloaders.**
