#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	if [ "$(which brew)" = "brew not found" ]; then
		if [ $(which ruby) = "ruby not found" ] || [ "$(which curl)" = "curl not found" ]; then
			echo "You must install Ruby and cURL before running this script!";
		else
			ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		fi;
	fi;
	source ~/.bash_profile;
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
