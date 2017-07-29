#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# Copy fonts
cp ./fonts/* /Library/Fonts/

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	if [ "$(which brew)" = "brew not found" ] || ["$(which brew)" = ""]; then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi;
  # Get tmux package manager ready
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # Install NVM
  curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
  # Install go with brew before bash profile
  brew install go
	source ~/.bash_profile;
  # Give installation files execute permission
  for file in ~/{osconfig,install,brew,nvm,npm,pip,gems,go,vim}.sh; do
    chmod +x $file;
  done;
  unset file;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
