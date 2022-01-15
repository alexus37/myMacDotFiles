#!/bin/bash

# install zsh plugins
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


$HOME/.fzf/install --bin

if [[ "$(command -v pip3)" ]]; then     
    pip3 install --user thefuck; 
fi 

if [[ "$(command -v apt)" ]]; then     
    sudo apt install vim -y
fi 

# copy all the files
cat .zshrc > $HOME/.zshrc
cp .fzf.zsh $HOME/.fzf.zsh
cp .vimrc $HOME/.vimrc
chsh -s /usr/bin/zsh $USERNAME
