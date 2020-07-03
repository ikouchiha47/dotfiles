### Dotfiles


#### Stuff installed by default

Base setup. Run `bash ./install.sh`

- wireless tools
- openssh
- X
- sudo
- neovim
- fish
- git
- pulseaudio, alsa
- openbox
- dmenu, rofi, nitrogen
- lxappearance, dolphin and some other stuff
- yay, and yay stuff

### yay stuff

Run `bash ./yaystuff.sh`

- polybar
- fantasque fonts and breeze-icons
- skippy-xd (for show all windows)
- ksuperkey (for Windows+command style actions)

### Touchpad config

If needed please copy the touchpad config.
Run `bash ./dev/touchpad.sh`

### Development environment

Run `./dev/install.sh`

- fisher and plugins
- chruby
- go (1.14)
- nvm to install nodejs

### Monitor detection

Uses udev rules to detect drm events (monitor plug in) and run monitor setup script

- cp monitors/{au.sh,autorandr.py} ~/.config/
- chown root:root ~/.config/au.sh
- cp 40-monitor-plug.rules /usr/lib/udev/rules.d/
- udevadm control --reload-rules
 
