# Matheus' dotfiles

Personal dotfiles for my macOS environment. Strongly based on @mathiasbynens [dotfiles](https://github.com/mathiasbynens/dotfiles) repo.

## Disclaimer

These are my dotfiles that I use when setting up a new machine or when restoring some configs on my current machine.

I made this repo very personal so I wouldn't suggest you to fork this repo. Instead fork Mathias' one, as it is designed for customization.

## Set up a new machine (first time usage)

New machines usually does not include crucial Developer tools, so first run:

```bash
xcode-select --install
```

`git` should be available now, so proceed by running:

```bash
git clone https://github.com/mkxml/dotfiles.git && cd dotfiles && source bootstrap.sh
```

If everything went OK so far, run:

```bash
~/install.sh
```

or (if the machine has an SSD):

```bash
~/install.sh --ssd
```

### Next steps

- Configure iCloud;
- Set up your `~/.secrets` with your secret env variables;
- Choose a cool wallpaper;
- Enjoy!

## Useful scripts for machine maintenance

Reinforce the macOS default config (also clears the dock)

```bash
~/osconfig.sh
```

Brew (install/update brew and all formulas)

```bash
~/brew.sh
```

NVM (install/update node version and migrate all global pkgs)

```bash
~/nvm.sh
```

NPM (install/update all nodejs global pkgs)

```bash
~/npm.sh
```

Gems (install/update all ruby gems)

```bash
~/gems.sh
```

PIP (install/update all python tools)

```bash
~/pip.sh
```

Go (install/update all go tools)

```bash
~/go.sh
```

Rust (install/update all rust tools)

```bash
~/rust.sh
```

VIM (install/update all vim plugins)

```bash
~/vim.sh
```

MAS (Mac App Store apps)

```bash
~/mas.sh
```

## If you decide to fork this repo

If you are forking my repo instead of the original one remember to change the `.extras` file, there I specify the author (myself) of the commits to git.

Also, you may want to change the `.path` to best suit your environment.

Remember to check `osconfig.sh` as well because there are some options there that are related to personal taste.

## Original Author

| [![twitter/mathias](http://gravatar.com/avatar/24e08a9ea84deb17ae121074d0f17125?s=70)](http://twitter.com/mathias "Follow @mathias on Twitter") |
|---|
| [Mathias Bynens](https://mathiasbynens.be/) |

## Modified by

[Matheus Kautzmann](https://github.com/mkxml)
