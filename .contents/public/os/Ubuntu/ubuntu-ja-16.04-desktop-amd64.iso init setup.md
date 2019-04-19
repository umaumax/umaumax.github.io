# ubuntu-ja-16.04-desktop-amd64.iso init setup

Ubuntu 16.04 LTS 日本語 Remix リリース

[Comment \#24 : Bug \#1579712 : Bugs : appstream package : Ubuntu]( https://bugs.launchpad.net/ubuntu/+source/appstream/+bug/1579712/comments/24 )
```
cd /tmp && mkdir asfix
cd asfix
wget https://launchpad.net/ubuntu/+archive/primary/+files/appstream_0.9.4-1ubuntu1_amd64.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/libappstream3_0.9.4-1ubuntu1_amd64.deb
sudo dpkg -i *.deb
```

```
sudo apt-get update
sudo apt-get install -y ssh
```

----

```
sudo apt-get install -y xdotool
export DISPLAY=:0
(sleep 2 && xdotool key Tab Tab Tab Tab && xdotool key Return) &
LANG=C xdg-user-dirs-gtk-update
```

[How to change system proxy settings from the command line on Ubuntu desktop \- Ask Xmodulo]( http://ask.xmodulo.com/change-system-proxy-settings-command-line-ubuntu-desktop.html )
```
export DISPLAY=:0
proxy=''
port=8080
gsettings set org.gnome.system.proxy mode 'manual'
gsettings set org.gnome.system.proxy.http host "$proxy"
gsettings set org.gnome.system.proxy.http port "$port"
gsettings set org.gnome.system.proxy.https host "$proxy"
gsettings set org.gnome.system.proxy.https port "$port"
gsettings set org.gnome.system.proxy.ftp host "$proxy"
gsettings set org.gnome.system.proxy.ftp port "$port"
gsettings set org.gnome.system.proxy.socks host "$proxy"
gsettings set org.gnome.system.proxy.socks port "$port"

# gsettings set org.gnome.system.proxy mode 'none'
```

----

# WIP