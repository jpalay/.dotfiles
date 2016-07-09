# BASH_COMPLETION ADDITIONS
# if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
#     . /opt/local/etc/profile.d/bash_completion.sh
# fi
#
# if [ -f `brew --prefix`/etc/bash_completion ]; then
#     . `brew --prefix`/etc/bash_completion
# fi

VIRTUALENV_SCRIPT=/usr/bin/virtualenvwrapper.sh
TERMINAL=urxvt

if [[ -a ~/.local_settings ]]; then
    source ~/.local_settings
fi

source ~/.dotfiles/.functions.bash
source ~/.dotfiles/.aliases
source ~/.dotfiles/.prompt

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

export PATH="~/bin:$PATH"
export HISTIGNORE='  *'

export WORKON_HOME=$HOME/.virtualenvs
source $VIRTUALENV_SCRIPT

touch ~/.last_venv.txt
last_venv=$(cat ~/.last_venv.txt)
if [ $last_venv ]; then
    workon $last_venv
fi
