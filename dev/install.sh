echo "setting up devel env"

yay -S chruby-fish
yay -S ruby-install

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher add edc/bass
fisher add jhillyerd/plugin-git

curl -L https://dl.google.com/go/go1.14.4.linux-386.tar.gz -o go1.14.4.src.tar.gz
tar -C /usr/local -xzf go1.14.4.src.tar.gz

mkdir -p ~/dev/go
mkdir -p ~/dev/go/{src,pkg,bin}

fisher add jorgebucaran/fish-nvm
