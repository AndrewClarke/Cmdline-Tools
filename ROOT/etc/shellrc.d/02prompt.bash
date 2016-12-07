:

# If set: do not follow sym links
# set -P
#
# Other prompting for root

_t=""
if test "$EUID" = 0; then
    _u="\h"
    _p=" #"
else
    _u="\u@\h"
    _p=">"
    if test \( "$TERM" = "xterm" -o "${TERM#screen}" != "$TERM" \) \
	    -a -z "$EMACS" -a -z "$MC_SID" -a -n "$DISPLAY"
    then
	_t="\$(ppwd \l)"
    fi
fi

# With full path on prompt
PS1="${_t}${_u}:\w${_p} "

# # With short path on prompt
# PS1="${_t}${_u}:\$(spwd)${_p} "

# # With physical path even if reached over sym link
# PS1="${_t}${_u}:\$(pwd -P)${_p} "

export PS1 PS2

unset _u _p _t

