#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

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
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install android-ndk
brew install android-platform-tools
brew install android-sdk
brew install dark-mode
brew install erlang
brew install elixir
#brew install exiv2
brew install ffmpeg
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install libbpg
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rebar
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli

# Install Node.JS and NPM
brew install node

# Install pip
brew install pip

# Install brew cask to install some GUI-based apps later
brew install caskroom/cask/brew-cask

# Install some useful GUI-based apps
brew cask install adobe-creative-cloud
brew cask install alfred
brew cask install android-studio
brew cask install appcleaner
brew cask install atom
brew cask install clion
brew cask install cocos-code-ide
brew cask install dropbox
brew cask install eclipse-java
brew cask install filezilla
brew cask install firefox
brew cask install google-chrome
brew cask install java
brew cask install libreoffice
brew cask install moom
brew cask install opera
brew cask install skype
brew cask install spotify
brew cask install sublime-text

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup

# Reboot the machine
echo "Rebooting machine..."
sudo shutdown -r now
