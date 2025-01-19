export PROMPT_COMMAND="$PROMPT_COMMAND pwd > ~/.most_recent_directory; "
cd `cat ~/.most_recent_directory`
export PATH="/opt/homebrew/bin:/Users/`whoami`/bin:$PATH"
# BASH_COMPLETION ADDITIONS
[[ -r "/opt/homebrew/Cellar/bash-completion@2/2.11/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/Cellar/bash-completion@2/2.11/etc/profile.d/bash_completion.sh"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source ~/.dotfiles/.git-completion.bash


if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# VIRTUALENV_SCRIPT=/usr/local/bin/virtualenvwrapper.sh

if [[ -a ~/.local_settings ]]; then
    source ~/.local_settings
fi

source ~/.dotfiles/.functions.bash
source ~/.dotfiles/.aliases
# source ~/.dotfiles/.prompt

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# export PYTHONSTARTUP="$HOME/.pyrc"

export EDITOR=vim
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# export PATH="~/anaconda3/bin:$PATH"
export HISTIGNORE='  *'
# eval "$(hub alias -s)"

# export WORKON_HOME=$HOME/.virtualenvs
# source $VIRTUALENV_SCRIPT

touch ~/.last_venv.txt
last_venv=$(cat ~/.last_venv.txt)
if [ $last_venv ]; then
    workon $last_venv
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
set -o vi
