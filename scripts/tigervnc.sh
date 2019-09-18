#!/bin/bash

yum install novnc xorg-x11-xinit tigervnc-server xterm xfce4-panel xfwm4 -y

echo "export DISPLAY=$HOSTNAME:0" > /usr/local/bin/tigervnc.sh
echo "export XFCE_PANEL_MIGRATE_DEFAULT=1" >> /usr/local/bin/tigervnc.sh
echo "/usr/bin/novnc_server --vnc localhost:5901 --listen 6901 &" >> /usr/local/bin/tigervnc.sh
echo "xinit -- /usr/bin/Xvnc :0 -auth /root/.Xauthority -depth 24 -desktop $HOSTNAME:0 -fp /usr/share/fonts/X11//misc,/usr/share/fonts/X11//Type1 -geometry 1280x1024 -pn -SecurityTypes=none -rfbport 5901 -rfbwait 30000 -NeverShared &" >> /usr/local/bin/tigervnc.sh
echo "/usr/bin/xfce4-panel &" >> /usr/local/bin/tigervnc.sh
echo "/usr/bin/xfwm4 &" >> /usr/local/bin/tigervnc.sh

chmod 700 /usr/local/bin/tigervnc.sh
