:

set -x
unalias 2>&- ls l lm L LM li lte ll l. la ls-l || true

if [[ -n "$_COLOR_MY_LS" && -n "$LS_COLORS" ]]; then
    ls() { LANG=C /bin/ls $_LS_FLAGS --color=tty "$@"; }
else
    ls() { LANG=C /bin/ls $_LS_FLAGS "$@"; }
fi

l()   { ls -la "$@"; }
lm()  { l "$@" | ${PAGER:=less}; }
L()   { l -d "$@"; }
LM()  { lm -d "$@"; }
li()  { l "$@" *.@(dsp|src|ext|trg|set|icn|ctl|4gh|in|inc|pl|pm|py|rb|java|lua|js); }
lte() { l "$@" *.@(trg|ext); }

alias ll='ls -l'
alias l.='ls -d .[a-zA-Z]*'
alias la='ls -la'
alias ls-l='ls -l'

set +x

