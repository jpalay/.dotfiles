# source ~/etc/activate-completion.bash
# source ~/etc/git-completion.bash
source ~/.functions.bash
source ~/.aliases
source ~/.prompt

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# export PYTHONSTARTUP="$HOME/.pyrc"

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

export PATH="~/bin:$PATH"

# BASH_COMPLETION ADDITIONS
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

export HISTIGNORE='  *'
eval "$(hub alias -s)"

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
