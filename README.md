# Matheus' dotfiles

Personal dotfiles for my macOS environment. Strongly based on @mathiasbynens [dotfiles](https://github.com/mathiasbynens/dotfiles) repo.

## Disclaimer

These are my dotfiles that I use when setting up a new machine or when restoring some configs on my current machine.

I made this repo very personal so I wouldn't suggest you to fork this repo. Instead fork Mathias' one, as it is designed for customization.

## Running script on a new machine

New machines usually does not include crucial Developer tools, so first run:

`xcode-select install`

After that `git` should be available, so continue by running:

`git clone https://github.com/mkautzmann/dotfiles.git && cd dotfiles && source bootstrap.sh`

The macOS defaults

`./.macOS`

Brew

`./brew.sh`

NPM

`./npm.sh`

Gems

`./gems.sh`

PIP

`./pip.sh`

VIM

`./vim.sh`

## If you decide to fork this repo

If you are forking my repo instead of the original one remember to change the `.extras` file, there I specify the author (myself) of the commits to git.

Also, you may want to change the `.path` to best suit your environment.

Remember to check `.macOS` as well because there are some options there that are related to personal taste.

## Original Author

| [![twitter/mathias](http://gravatar.com/avatar/24e08a9ea84deb17ae121074d0f17125?s=70)](http://twitter.com/mathias "Follow @mathias on Twitter") |
|---|
| [Mathias Bynens](https://mathiasbynens.be/) |

## Modified by

[Matheus Kautzmann](https://github.com/mkautzmann)
