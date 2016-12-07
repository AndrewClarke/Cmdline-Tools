:

if test "$is" = ksh; then
    # Use a ksh specific history file and enable line editor
    if [[ -n "$ORIGIN_USER" ]]
      then HISTFILE="$HOME/.history_$ORIGIN_USER"
      else HISTFILE="$HOME/.kshrc_history"
    fi
    : ${VISUAL:=vi}
    export VISUAL
fi
