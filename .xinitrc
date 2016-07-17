#! /bin/bash
setxkbmap -layout us -variant dvorak
xmodmap -e "keycode 133 = Escape"

xrdb ~/.Xresources

dropbox &
cd /home/josh/Dropbox/1Password/1Password.agilekeychain &&
    python -m http.server 2000 -b 127.0.0.1 &

syndaemon -i .5 -t -K -R -d
cd /home/josh &&
    feh --bg-center .lockscreen/wallpaper.png &&
    exec i3
