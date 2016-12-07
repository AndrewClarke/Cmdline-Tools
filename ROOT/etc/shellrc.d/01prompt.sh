:

# Returns short path (last two directories)
spwd() {
  ( IFS=/
    set $PWD
    if test $# -le 3
      then echo "$PWD"
      else eval echo \"..\${$(($#-1))}/\${$#}\"
    fi )
}

# Set xterm prompt with short path (last 18 characters)
ppwd () {
    local _t="$1" _w _x
    test -n "$_t"    || return
    test "${_t#tty}" = $_t && _t=pts/$_t
    test -O /dev/$_t || return
    _w="$(dirs +0)"
    _x="${_w//[^x]/x}"
    test ${#_x} -le 18 || _w="/...${_w:$((${#_x}-18))}"
    echo -en "\e]2;${USER}@${HOST}:${_w}\007\e]1;${HOST}\007" > /dev/$_t
}

# default prompts for all shells
# PS1='\u:\w\$ '
PS1='\h:\w\$ '
PS2='> '
export PS1 PS1

PSpfx=''
[[ $EUID -eq 0 ]] && PSpfx='# '
export PSpfx

export usrhom="$(cut -d: -f1,6 /etc/passwd | sed -n 's#\(.*\):/.*/.*#~\1#p')"

