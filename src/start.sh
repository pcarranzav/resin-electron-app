#!/bin/bash

# Make sudo actually work
HOSTNAME=$(cat /etc/hostname)
echo "127.0.1.1 $HOSTNAME" >> /etc/hosts
hostname $HOSTNAME

if [ "$INITSYSTEM" != "on" ]; then
  /usr/sbin/sshd -p 80 &
fi

if [ -f /data/99-calibration.conf ]; then
	cp /data/99-calibration.conf /usr/share/X11/xorg.conf.d/99-calibration.conf
fi

amixer -c 1 set Speaker 100%
amixer -c 1 set Headphone 100%

xinit /usr/src/app/launch_app.sh
