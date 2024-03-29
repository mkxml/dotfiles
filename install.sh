#!/usr/bin/env zsh

sudo -v

echo "Configuring and installing everything"

# Install all our formulas from brew
source ~/brew.sh

# Install node.js and npm
source ~/nvm.sh

# Install npm global packages
source ~/npm.sh

# Install python tools
source ~/pip.sh

# Install ruby gems
source ~/gems.sh

# Install go tools
source ~/go.sh

# Install rust tools
source ~/rust.sh

# Configure vim and install plugins
source ~/vim.sh

# OS config
source ~/osconfig.sh $1

# Reboot machine
echo "All set! Rebooting the mac."
sudo reboot
