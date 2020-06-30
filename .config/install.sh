sudo pacman -S dunst dmenu picom rofi nitrogen mpd ncmcpp polybar pulseaudio pulseaudio-alsa bluez bluez-utils blueman networkmanager

yay skippy-xd
yay ksuperkey
yay fantasque-sans-mono
yay material-icons
yay networkmanager-dmenu
yay font-manager
sudo pacman -S gucharmap
sudo pacman -S ttf-fira-code
sudo pacman -S xorg-xfd
sudo pacman -S parcellite
sudo pacman -S arandr
sudo pacman -S alacritty

# pacman -S nerd-fonts-complete
# yay siji

curl -o Iosevka_Nerd_Font_Regular.ttf -L https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete.ttf
mkdir -p ~/.local/share/fonts/
mv Iosevka_Nerd_Font_Regular.ttf ~/.local/share/fonts

fc-cache ~/.local/share/fonts


# neovim vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \

       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# copying scripts from bin to ~/.local/bin
echo "Add ~/.local/bin to PATH"
mkdir -p ~/.local/
cp -r bin/ ~/.local/
