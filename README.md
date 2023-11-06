# Introduction:
I found unattended-upgrades script quite clunky. Reboot/shutdown kills GDM, but it is restarted by the script, and you are not notified that the update will be happening and you have no easy way to prevent the update once it is prepared.  
I created this quick script to have PackageKit provided auto update with notifications and Gnome support on Debian (unlike the unattended-upgrades python script). This way automatic upgrades will function similarly to Fedora or Opensuse(using PackageKit).

# How it looks:

Daily refresh:

![image](https://github.com/vari4bled/debian-auto-updater/assets/105917652/03bb8067-0d5f-41b6-9c2b-347ba32e11d2)

Prepared updates:

![image](https://github.com/vari4bled/debian-auto-updater/assets/105917652/3212642f-874c-4854-ba3f-e11654e669ff)

Shutdown:

![image](https://github.com/vari4bled/debian-auto-updater/assets/105917652/f76e0a55-ffa3-4884-8a47-be42a0cec363)

# Requirements
**Dependencies: gnome-packagekit packagekit-tools dconf-editor libnotify-bin plymouth (will be installed by install.sh)**  
**Splash kernel parameter (and recommended quiet)**

*With grub:*

https://wiki.archlinux.org/title/GRUB  
https://wiki.debian.org/Grub  

*With standard systemdboot setup:*

add splash and quiet to cmdline, example:  
cat /etc/kernel/cmdline  
root=UUID=12345 ro quiet splash  

# Install
As user with sudo rights (not root!):

git clone https://github.com/vari4bled/debian-auto-updater.git  
cd ./debian-auto-updater  
./install.sh  


# Configuration
You can modify the timers to suit your needs. By default it runs apt update between 04:00 and 04:10. And it downloads the updates themselves and queues them for install at reboot/shutdown on Sunday after 04:10. If it misses a run due to downtime it will run after a random time(10m).
To modify the timers you can edit and play around with the OnCalendar in:  
~/.config/systemd/user/apt-autoupdate-refresh.timer (This runs the daily apt refresh)  
~/.config/systemd/user/apt-autoupdate-update.timer (This downloads and queues updates on Sunday)  
To help with the OnCalendar:  
https://wiki.archlinux.org/title/systemd/Timers  


# Remove
You can just disable the timers(or manually delete files):  
systemctl --user disable apt-autoupdate-refresh.timer  
systemctl --user disable apt-autoupdate-update.timer  
systemctl --user stop apt-autoupdate-refresh.timer  
systemctl --user stop apt-autoupdate-update.timer  

# Warning:

**Use it at your own risk. I don't take responsiblity for borked systems/bootloaders.**
