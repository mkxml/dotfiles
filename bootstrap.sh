#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# Copy fonts
cp ./fonts/* /Library/Fonts/

function doIt() {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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
  # Install pip
  sudo easy_install pip
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	source ~/.zshrc;
  # Give installation files execute permission
  for file in ~/{osconfig,install,brew,nvm,npm,pip,gems,go,rust,vim,mas}.sh; do
    chmod +x $file;
  done;
  # Setup keyboard
  chmod +x ~/.keyboard/script/setup
  mkdir -p ~/.config
  cd ~/.keyboard
  script/setup
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
