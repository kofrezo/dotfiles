# Dotfiles

This repository contains shell scripts and documentation to install awesome
minimal Debian Stretch with awesome dotfiles.

See SCREENSHOTS.md for example screenshots when everything is applied.

## Debian Stretch Installation

Download and create a CD-ROM or USB-Stick with Debian Stretch and make a minimal
installation without Desktop environment and login to console than follow the
following steps.

### Protect $HOME

First of all protect your home folder from spying eyes.

chmod 0750 $HOME

### Make your system usable installing vim ;-)

    sudo apt install vim

### Increase Grub & Console Resolution

Detect your supported resolutions by hitting "c" key in grub and typing vbeinfo.
Note your favorite resolution e.g. 1600x1200x32 and modify the following lines in
/etc/default/grub and /etc/grub.d/00_header file (Add if missing).

    sudo vim /etc/default/grub
    # GRUB_GFXMODE=1600x1200x32
    # GRUB_GFXPAYLOAD=1600x1200x32

    sudo vim /etc/grub.d/00_header
    # if [ "x${GRUB_GFXMODE}" = "x" ] ; then GRUB_GFXMODE=1600x1200x32 ; fi
    # if [ "x${GRUB_GFXPAYLOAD}" = "x" ] ; then GRUB_GFXPAYLOAD=1600x1200x32 ; fi

    [...]

    # set gfxmode=${GRUB_GFXMODE}
    # set gfxpayload=${GRUB_GFXPAYLOAD}

Afterwards refresh grub and activate settings with the following command.

    sudo update-grub2

### Openbox Window Manager

To install and configure openbox window manager (not a full desktop environment)
proceed with the following steps.

    sudo apt install xinit openbox

You will want to checkout rc.xml for keybindings. You can also use the
activate_openbox with my dotfiles a bit more on the bottom. But be aware that
this will replace your ~/.config/openbox settings. But don't worry it creates
a backup at ~/.config/openbox.bak.

### Screen Resolution

The default screen resolution is rather low so use xrandr to detect a good one
and when you are happy add it to the openbox autostart script. I recommend it
to put it to the top so that you don't see your screen flickering on login.

    # List possible screens and resoltions
    xrandr
    # Try it out
    xrandr --output VGA-1 --mode 1920x1080 --rate 60
    # Apply to execute it on every startup
    mkdir ~/.config/openbox
    vim ~/.config/openbox/autostart
    # #!/usr/bin/env sh
    #
    # xrandr --output VGA-1 --mode 1920x1080 --rate 60


### Terminal Emulator

Terminator is a powerful terminal emulator written in python having useful
shortcuts to split terminal and will increase your productivty on the console.

    sudo apt install terminator

You can now use startx login and right click to start a terminal emulator.

### Transparency

To enable transparency you need a composite manager such as xcompmgr. Install
it and add it to you openbox autostart.

   sudo apt install xcompmgr
   vim ~/.config/openbox/autostart
   # xcompmgr &

### Wallpaper

To show a wallpaper in openbox install feh and configure it to automatically
start it on login.

    startx
    sudo apt install curl feh
    mkdir ~/Pictures
    curl https://raw.githubusercontent.com/kofrezo/dotfiles/master/Pictures/background.png > ~/Pictures/background.png
    feh --bg-scale ~/Pictures/background.png
    vim ~/.config/openbox/autostart
    # sh ~/.fehbg
    chmod +x ~/.config/openbox/autostart

### Window Manager Theme

To enable simple elegant arc theme instead of default baby blue ones install the
arc-theme and gtk2-engine.

    sudo apt install gtk2-engine git
    git config user.name Your Name
    git config user.email your.name@example.com
    mkdir ~/Sourcecode
    cd ~/Sourcecode
    git clone https://github.com/dglava/arc-openbox.git

Right click and select Obconf and install ard-dark.obt and select it.

### Dotfiles

Working on the commandline can be rather hard without a properly setup editor
so lets install vim plugins and configure it a bit. Additionaly it will change
your prompt to be a bit more informative.

    git clone https://github.com/kofrezo/dotfiles.git
    cd dotfiles
    sudo ./activate_dotfiles

### Conky System Monitor

Summarizing information about your system what time it is etc. can be done
using conky. Install conky and try out prepared configuration from dotfiles.

    sudo apt install conky conky-all

Next you can execute the activate_conky_monitor script from the dotfiles to
to install conky monitoring scripts I found on gnome-look.org and adjusted them
a bit.

    cd dotfiles
    ./activate_conky_monitor

To automatically start these when logging in add them to the autostart.

    vim ~/.config/openbox/autostart
    # conky &

If your Net and Wifi graph does not work out of the box it is very likely that
your adapters are named differently. Just get your adapter name with the ip
command and replace them in ~/.conkyrc and ~/.lua/clock_rings.lua

### Grub Background Image

To apply the current background also to Grub copy the grub image to system and
activate it.

    sudo mkdir /usr/share/images/grub
    sudo cp Pictures/grub.tga /usr/share/images/grub
    sudo vim /etc/default/grub
    # GRUB_BACKGROUND="/usr/share/images/grub/grub.tga"
    sudo update-grub2

### Console Resolution

To change the resolution of the console add video parameter to kernel.

    sudo vim /etc/default/grub
    # GRUB_CMDLINE_LINUX_DEFAULT="quiet video=1600x1200-32"
    sudo update-grub2

### Gnome Display Manager

Login to console and type startx is rather annoying and can be done via a
graphical tool. These tools are called Display Manager one of them is lightdm.
lightlocker will exten lightdm to support locking your screen.

    sudo apt install lightdm light-locker
    cd dotfiles
    sudo cp Pictures/login.png /usr/share/images/desktop-base/lightdm.png
    sudo vim /etc/lightdm/lightdm-gtk-greeter.conf
    # background=/usr/share/images/desktop-base/lightdm.png
    sudo vim /etc/lightdm/lightdm.conf
    # allow-guest=false
    # display-setup-script=xrandr --output VGA-1 --mode 1600x1200 --rate 60

Now you can reboot and login using your display manager instead of console. If
lightdm does not start check /var/log/lighdm/lightdm.log for errors.


### Webbrowser

Having a browser to research while setup your system is helpful so lets install
Google Chrome since the open source version chromium crashed sometimes on my
computer. You can of course install the browser you prefer.

    mkdir ~/Downloads
    curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > ~/Downloads/google-chrome-stable_current_amd64.deb
    sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb

### Additional Software

    sudo apt install gimp nautilus opmenu thunderbird

Copyright (c) 2017, Daniel Kröger
