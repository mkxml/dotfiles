# Check if tmux exists
if [ -x "$(command -v tmux)" ]; then
  # Check if not inside tmux start it
  if [[ -z "$TMUX" ]]; then
      if tmux has-session 2>/dev/null; then
          exec tmux attach
      else
          exec tmux
      fi
  fi
fi

export GOPATH="$(go env GOPATH)";

# Add go tools to the $PATH
export PATH="$GOPATH/bin:$PATH";

# Add anaconda tools
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize;

# Add android platform tools to path
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH";

export ANDROID_HOME="$HOME/Library/Android/sdk";
export MAVEN_OPTS="-Xms1024m -Xmx2048m -Xss2048k";

export NVM_DIR="$HOME/.nvm";
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh";  # This loads nvm

# Load secrets
source ~/.secrets;

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit (I commited for convenience, beware in forking!)
for file in ~/.{secrets,path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;


# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

export PATH="$HOME/.cargo/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";

# add mysql to PATH
export PATH="/Applications/MySQLWorkbench.app/Contents/MacOS:$PATH";

# Bash completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d";
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh";

# NVM completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# RBENV
eval "$(rbenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/opt/libpq/bin:$PATH"
