#!/usr/bin/env zsh

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
brew install awscli
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

# Install some useful GUI-based apps
brew install --cask java
brew install --cask airflow
brew install --cask anaconda
brew install --cask android-studio
brew install --cask arduino
brew install --cask alfred
brew install --cask appcleaner
brew install --cask balenaetcher
brew install --cask bartender
brew install --cask cleanmymac
brew install --cask coconutbattery
brew install --cask cyberduck
brew install --cask eclipse-java
brew install --cask electrum
brew install --cask elgato-thunderbolt-dock
brew install --cask dash
brew install --cask discord
brew install --cask docker
brew install --cask dropbox
brew install --cask firefox
brew install --cask forticlient
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask google-backup-and-sync
brew install --cask iina
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask insomnia
brew install --cask keyboard-cleaner
brew install --cask microsoft-office
brew install --cask microsoft-teams
brew install --cask mounty
brew install --cask mysql-utilities
brew install --cask mysqlworkbench
brew install --cask notion
brew install --cask opera
brew install --cask parallels
brew install --cask parallels-toolbox
brew install --cask postico
brew install --cask postman
brew install --cask safari-technology-preview
brew install --cask sketch
brew install --cask skype
brew install --cask soapui
brew install --cask steam
brew install --cask tinymediamanager
brew install --cask transmission
brew install --cask tunnelblick
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask whatsapp
brew install --cask wireshark
brew install --cask zotero

# Remove outdated versions from the cellar.
brew cleanup

echo "brew.sh done! You may reboot when possible."
