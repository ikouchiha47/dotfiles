echo "updating pacman keys"
sudo pacman -Sy archlinux-keyring

echo "installing essentials"
sudo pacman -S netctl wireless_tools dhcpcd dialog wpa_supplicant openssh bash bluez bluez-utils blueberry pulseaudio pavucontrol

echo "install x"
sudo pacman -S xorg-server xorgs-apps xclip vim tmux

echo "install tools"
sudo pacman -S dunst dmenu picom rofi feh pulseaudio-alsa pulseaudio-bluetooth aria2 svn git alsa-utils exfat-utils ntfs-3g
sudo pacman -S gucharmap xorg-xfd alacritty slock neovim python-pynvim fish thunar breeze-icons the_silver_searcher scrot 

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

echo "install yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sirc

echo "install openbox specific config"
