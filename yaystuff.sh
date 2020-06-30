echo "installing yay"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sirc

yay polybar
yay openbox-themes
yay skippy-xd
yay ksuperkey
yay fantasque-sans-mono
yay material-icons
yay networkmanager-dmenu
yay font-manager
yay breeze-icons

