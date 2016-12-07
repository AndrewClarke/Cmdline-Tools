
[[ -r $HOME/.vars ]] && . $HOME/.vars

: ${ORIGIN_HOST:=$HOSTNAME} ${ORIGIN_SITE:=unset} ${ORIGIN_USER:=aclarke}
export ORIGIN_HOST ORIGIN_SITE ORIGIN_USER
export DEPTH=

## : ${APPL:=~/tickit/rel-3.2}
## export APPL

export FPATH=$HOME/bin.f

export wacgen=~/src/wacgen/tools-trunk
export wacgenlib=~/src/wacgen/lib-trunk

export ICON=/opt/unicon-12.1
export IPATH=$wacgen/source/iconlib

export PATH="/usr/sbin:/sbin:$PATH"
[[ -n "$ADK" && -d "$ADK/" ]] && export PATH="$ADK/bin:$PATH"
[[ -d "$ICON/" ]] && export PATH="$ICON/bin:$PATH"
[[ -d ~/bin/ ]] && export PATH="$HOME/bin:$PATH"
[[ -d ~/bin.local/ ]] && export PATH="$HOME/bin.local:$PATH"

[[ -d $HOME/.rvm/bin ]] && export PATH=$PATH:$HOME/.rvm/bin

[[ -f ~/.bashrc ]] && . ~/.bashrc

unset LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONETARY
unset LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME
export LANG=C LANGUAGE=C

