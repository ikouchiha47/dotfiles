echo "installing yay"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sirc

yay -S polybar
yay -S openbox-themes
yay -S skippy-xd
yay -S ksuperkey
yay -S fantasque-sans-mono
yay -S material-icons
yay -S networkmanager-dmenu
yay -S font-manager
yay -S breeze-icons
yay -S informant
