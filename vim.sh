# Install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins

# Install Vundle plugins before running Vim the first time
vim +PluginInstall +qall

# Compile YouCompleteMe plugin
~/.vim/bundle/YouCompleteMe/install.py --cland-completer --tern-completer
