echo "installing essentials"
sudo pacman -S netctl wireless_tools dhcpcd dialog wpa_supplicant openssh bash

sudo pacman -S xorg-server xorgs-apps vim tmux

sudo pacman -S dunst dmenu picom rofi nitrogen lxappearance pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez bluez-utils blueberry networkmanager aria2 svn git alsa-utils
sudo pacman -S gucharmap xorg-xfd parcellite arandr alacritty slock neovim python-pynvim fish dolphin breeze-icons the_silver_searcher scrot 

sudo pacman -S i3-wm gsimplecal

echo "installing fonts"

sudo pacman -S ttf-hack ttf-liberation ttf-fira-code 
curl -o Iosevka_Nerd_Font_Regular.ttf -L https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete.ttf
mkdir -p ~/.local/share/fonts/
mv Iosevka_Nerd_Font_Regular.ttf ~/.local/share/fonts

fc-cache ~/.local/share/fonts

echo "fish setup"
chsh -s $(which fish)

echo "install vim-plug"
# neovim vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \

       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# copying scripts from bin to ~/.local/bin
echo "Add ~/.local/bin to PATH"
mkdir -p ~/.local/
cp -r bin/ ~/.local/

echo "copying pictures"
mkdir -p ~/Pictures
cp -r pictures/. ~/Pictures/

echo "graphics driver"
x=$(lspci | grep -e VGA | cut -d' ' -f 2-)
echo "$x"
echo "please install the appropiate graphics driver from list"
pacman -Ss xf86-video

echo "please instal yay and yay stuff"
