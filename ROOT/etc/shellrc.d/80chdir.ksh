:

function _cd {  # preserve the built-in
    cd "$@"
}   # _cd


function chdir {
    typeset x y z result opwd="$OLDPWD" spwd="$PWD" ARGV

    typeset __sh hflag="${CDHOME-$HOME}" wflag=0
    while getopts :hw __ch; do
	case "$__ch" in
	  h) hflag="$HOME";;		# go to my true HOME, not the optional $CDHOME
	  w) wflag=1;;			# 'whence' the arg and go it's directory
	esac
    done
    shift $((OPTIND-1))
    [[ -n "$__CDQ__" ]] && qflag=-q	# sekrit way to silence ch & chdir

    set -A ARGV -- "$@"
    case "$wflag-$#" in
      0-0) set -A ARGV -- "$hflag" ;;	# no args? go to the nominated HOME

      0-1)
        # 1 arg and no -w
	# magical spelling and/or special name interpretation
        [[ ! -d "${ARGV[0]}" ]] && [[ -n "$CDSPELL" ]] && x="$(cdspell "${ARGV[0]}")"

	if [[ -n "$x" ]]; then
	    ARGV[0]="$x"
	elif [[ -d "$1" ]]; then
	    ARGV[0]="$1"
	else
	    short_auth ARGV "$1"
	fi
        ;;


      1-*)
	if [[ -e "$1" ]]; then
	    x="$1"
	else
	    whence "$@" | while read x; do [[ -n "$x" ]] && break; done
	    if [[ -z "$x" ]]; then
		if [[ $# -eq 1 ]]
		  then echo >&2 cd -w: cannot find "$@"
		  else echo >&2 cd -w: cannot find any of "$@"
		fi
		return 1
	    fi
	fi

        set -A ARGV -- ${x%/*}
	;;
    esac
    set -- "${ARGV[@]}"

    # allow short-forms - jees you guys get it easy!
    x="$1"
    while [[ "$x" = ...* ]]; do
        y="${x##*(.)}"
        z="${x%$y}"
        x="${z%.}/..$y"
    done

    if [[ "$x" != "$1" ]]; then
        shift
        set -- "$x" "$@"
    fi

    cd "$@"
    result=$?

    if [[ $result -ne 0 ]]; then
        # the cd may have been less than successful
        # - return to last good place
        # this is because multi-arg cd can do ... clever things
        #
        cd "$spwd" 2>&-
        OLDPWD="$opwd"          # restore OLDPWD
        return $result
    fi

    # restore OLDPWD if we haven't actually changed PWD
    [[ "$PWD" = "$spwd" ]] && OLDPWD="$opwd"

    # search up the directory tree for a .env script (modern) or .stage (archaic)
    # will NOT find one in / - I think that's Good.
    #
    typeset ef dir="$PWD"
    # also block stage effects in a conversion dumping ground circa March 2010
    if [[ "$dir" != /opt2/rcs2svn/* ]]; then
        while [[ -z "$ef" && -n "$dir" ]]; do
            if [[ -x "$dir/.env" ]]; then
                ef="$dir/.env"
                break
            elif [[ -x "$dir/.stage" ]]; then
                ef="$dir/.stage"
                break
            else
                dir="${dir%/*}"
            fi
        done
    fi

    # check for change of environment
    if [[ -n "$ef" && "$ef" != "$ENV_FILE" ]]; then
        # stop the old environment (if it was started)
        [[ -n "$ENV_FILE" && -x "$ENV_FILE" ]] && . "$ENV_FILE" stop

	# check for change of release area.
	for __sp in $releases; do
	    eval __se='"$'"$__sp"'"'
	    [[ "$PWD" = "$__se"?(/*) ]] || continue # not in there...
	    [[ "$stage" = "$__sp" ]] && break               # still in there!
	    # a new stage has been reached

	    stage_enter $__sp
	    [[ -n "$cust_key" ]] && echo customer $cust_key
	    break
	done

        # move to new environment and start it
        export ENV_FILE="$ef"
        . "$ENV_FILE" start
    fi

    [[ -x ./.cdrc ]] && . ./.cdrc

    return 0

}   # chdir


# override and kick-start the smarts
alias cd=chdir
chdir .

