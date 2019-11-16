#!/bin/bash
# THIS IS A WARNING: DEPLOYED ON MY VPS'S ON PROXMOX IT MODIFIES GRUB I DON'T RECOMMEND BLINDLY USING
echo `# ttyS0 - getty
#
# This service maintains a getty on ttyS0 from the point the system is
# started until it is shut down again.

start on stopped rc RUNLEVEL=[12345]
stop on runlevel [!12345]

respawn
exec /sbin/getty -L 115200 ttyS0 vt102` > /etc/init/ttyS0.conf

echo `# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
 
GRUB_DEFAULT=0
GRUB_TIMEOUT=1
GRUB_DISTRIBUTOR='lsb_release -i -s 2> /dev/null || echo Debian'
GRUB_CMDLINE_LINUX="console=tty0 console=ttyS0,115200n8"
 
# Uncomment to disable graphical terminal (grub-pc only)
GRUB_TERMINAL=serial
GRUB_SERIAL_COMMAND="serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1"
 
# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command vbeinfo
#GRUB_GFXMODE=640x480
 
# Uncomment if you dont want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true` > /etc/default/grub

update-grub
echo `Done, please add a serial on the VM`
echo ``
read `Press [Enter] to reboot`
reboot
