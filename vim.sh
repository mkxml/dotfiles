# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins

# Install Vundle plugins before running Vim the first time
vim +PluginInstall +qall

# Install vim-airline onedark theme
cp ~/themes/vim-airline/onedark.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/onedark.vim

# Compile YouCompleteMe plugin
~/.vim/bundle/YouCompleteMe/install.py --clang-completer --tern-completer
