
[[ -r $HOME/.vars ]] && . $HOME/.vars

: ${ORIGIN_HOST:=$HOSTNAME} ${ORIGIN_SITE:=unset} ${ORIGIN_USER:=aclarke}
export ORIGIN_HOST ORIGIN_SITE ORIGIN_USER
export DEPTH=
case "$HOSTNAME" in
  kubby) export APP=~/tickit/tod-3582 VIEW=~/tickit/rel-3.2 ;;
  *)     export APP=~/tickit-app VIEW=~/tickit-view ;;
esac
export FPATH=$HOME/bin.f
[[ -d /opt/unicon/bin ]] && export PATH="/opt/unicon/bin:$PATH"
[[ -d ~/bin ]] && export PATH="$HOME/bin:$PATH"
[[ -d ~/bin.local ]] && export PATH="$HOME/bin.local:$PATH"
[[ -d $HOME/.rvm/bin ]] && export PATH=$PATH:$HOME/.rvm/bin

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm # Load RVM into a shell session *as a function*

unset LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME
export LANG=C LANGUAGE=C

