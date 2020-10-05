
[[ -r $HOME/.vars ]] && . $HOME/.vars

: ${ORIGIN_HOST:=$HOSTNAME} ${ORIGIN_SITE:=unset} ${ORIGIN_USER:=aclarke}
export ORIGIN_HOST ORIGIN_SITE ORIGIN_USER
export DEPTH=

export FPATH=$HOME/bin.f

export PATH="/usr/sbin:/sbin:$PATH"  ### $wacgen/bin"
[[ -n "$ADK"        && -d "$ADK/"        ]] && export PATH="$ADK/bin:$PATH"
[[ -n "$ICON"       && -d "$ICON/"       ]] && export PATH="$ICON/bin:$PATH"
[[ -n "$GFORTHPATH" && -d "$GFORTHPATH/" ]] && export PATH="$GFORTHPATH:$PATH"
[[ -d ~/bin/ ]]                             && export PATH="$HOME/bin:$PATH"
[[ -d ~/bin.local/ ]]                       && export PATH="$HOME/bin.local:$PATH"
[[ -n "$RAKUDO"     && -d "$RAKUDO/"     ]] && export PATH="$RAKUDO/bin:$RAKUDO/share/perl6/site/bin:$PATH"

[[ -d $HOME/.rvm/bin ]] && export PATH=$PATH:$HOME/.rvm/bin

[[ -f ~/.bashrc ]] && . ~/.bashrc

## unset LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONETARY
## unset LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME
## export LANG=C LANGUAGE=C

