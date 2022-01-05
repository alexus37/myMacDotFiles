#!/bin/bash

# install zsh plugins
/bin/bash .scripts/install_zsh.sh

# activate 
chsh -s $(which zsh)