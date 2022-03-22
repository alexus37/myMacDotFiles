#!/bin/bash
echo "Start install dotfiles"
current_dir=$(pwd)

echo "Download zsh plugins"
# install zsh plugins
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab

$HOME/.fzf/install --bin

if [[ "$(command -v pip3)" ]]; then     
    pip3 install --user thefuck; 
fi 

if [[ "$(command -v apt)" ]]; then     
    sudo apt install vim -y
fi 

# Install nerd font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# nvim setup
echo "nvim setup"
apt install ruby-dev -y
# npm install -g typescript typescript-language-server eslint prettier eslint_d 
# npm i -g vscode-langservers-extracted

git clone https://github.com/alexus37/nvim.git $HOME/.config/nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim


# copy all the files
cat $current_dir/.zshrc > $HOME/.zshrc
cp $current_dir/.fzf.zsh $HOME/.fzf.zsh
cp $current_dir/.vimrc $HOME/.vimrc
cp $current_dir/.pryrc $HOME/.pryrc
chsh -s /usr/bin/zsh $USERNAME
