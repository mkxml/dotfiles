#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Prevents tmux from failing
brew install reattach-to-user-namespace

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php56 --with-gmp
brew reinstall python
brew install python3

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install telnet
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install cmake
brew install dark-mode
brew install erlang
brew install elixir
brew install fd
brew install ffmpeg
brew install git
brew install git-lfs
brew install hub
brew install imagemagick --with-webp
brew install lua
brew install libbpg
brew install lynx
brew install mas
brew install ninja
brew install openvpn
brew install p7zip
brew install pigz
brew install pv
brew install rebar
brew install rename
brew install ssh-copy-id
brew install tmux
brew install tree
brew install testssl
brew install vbindiff
brew install webkit2png
brew install yarn
brew install zopfli

# Install brew cask to install some GUI-based apps later
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Install some useful GUI-based apps
brew cask install java
brew cask install alfred
brew cask install appcleaner
brew cask install bartender
brew cask install electrum
brew cask install etcher
brew cask install dash
brew cask install discord
brew cask install docker
brew cask install dropbox
brew cask install filezilla
brew cask install firefox
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-backup-and-sync
brew cask install microsoft-office
brew cask install mounty
brew cask install mysql-utilities
brew cask install mysqlworkbench
brew cask install opera
brew cask install postman
brew cask install safari-technology-preview
brew cask install sketch
brew cask install skype
brew cask install tunnelblick
brew cask install spotify
brew cask install visual-studio-code
brew cask install vlc
brew cask install whatsapp

# Remove outdated versions from the cellar.
brew cleanup

echo "brew.sh done! You may reboot when possible."
