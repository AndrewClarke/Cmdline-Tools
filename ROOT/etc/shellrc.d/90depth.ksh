:

if [[ -n "$DEPTH" ]]; then
    set +o ignoreeof	# allow ^D exit of nested ksh
    export DEPTH="+$DEPTH"
else
    set -o ignoreeof	# login shell is protected from ^D exit
    export DEPTH=' '
fi

typeset -Z2 _h _m _s
SECONDS="$(date '+3600*%H+60*%M+%S')"   # reset shell's start time
