:

set -a
_ss='SECONDS%60'
_mm='(SECONDS/60)%60'
_hh='(SECONDS/3600)%24'

PS1='${PSpfx}${PSsession:+$PSsession-}${DEPTH# }${_x[(_m=_mm)+(_h=_hh)]}$_h:$_m '`echo $HOSTNAME | cut -f1 -d"."`':${WINDOW:+($((WINDOW+1))$FACETWINDOWNUMBER) }${PWD##$PSTRIM} '

PSTRIM='*/'
export PS1 PS2 PS3 PS4 PSTRIM _ss _mm _hh
set +a

## # SuSE's offering
## if test "$UID" = 0
##   then PS1="${HOST}:"'${PWD}'" # "
##   else PS1="${USER}@${HOST}:"'${PWD}'"> "
## fi

