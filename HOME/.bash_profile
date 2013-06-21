
export DEPTH=
export APP=~/tickit-app VIEW=~/tickit-view
export FPATH=$HOME/bin.f
[[ -d /opt/unicon/bin ]] && export PATH="/opt/unicon/bin:$PATH"
[[ -d ~/bin ]] && export PATH="$HOME/bin:$PATH"
[[ -d $HOME/.rvm/bin ]] && export PATH=$PATH:$HOME/.rvm/bin

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm # Load RVM into a shell session *as a function*

unset LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME
export LANG=C LANGUAGE=C

