source ~/etc/activate-completion.bash
source ~/etc/git-completion.bash
source ~/.functions
source ~/.aliases
source ~/.prompt

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

export PYTHONSTARTUP="$HOME/.pyrc"

export WORKON_HOME=~/venvs
source /usr/local/bin/virtualenvwrapper.sh

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# MACPORTS ADDITIONS
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/opt/local/libexec/gnubin:$PATH"
export PATH="~/bin:$PATH"

# BASH_COMPLETION ADDITIONS
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

export HISTIGNORE='  *'
