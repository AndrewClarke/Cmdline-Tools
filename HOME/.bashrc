
case $- in
  *i*) ;;
    *) return;;
esac

stty erase '^h'     # death to DEC for foisting the VT100 on the world.

shopt -s cmdhist histappend lithist autocd cdspell extglob globstar checkwinsize
set -o vi histexpand
set +H  # don't like ! expansion - ugh.
unset -f command_not_found_handle

export VISUAL=vi FCEDIT=vi EDITOR=vi
export HISTSIZE=1000 HISTFILESIZE=2000
export PROMPT_COMMAND='history -a; history -r'
export LESS='-M -e -F -i -Q -X -R'
export XGREP='-Z'


if [[ -z "$DEPTH" ]]; then
    set -o ignoreeof
    export DEPTH=' '
else
    set +o ignoreeof
    export DEPTH="+$DEPTH"
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# bash is too retarded for a $FPATH - have to load 'em manually
if [[ -d ~/bin.f/ ]]; then
    for i in ~/bin.f/*; do
        [[ -f "$i" && -x "$i" ]] && . $i
    done
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# NOTE: all except tmux needs a few extra 'normal' characters are wrapped
# inside \[ \] so that they compensate for the UTF encoded characters.
# Seems like bash isn't capable of taking their visible-length vs.
# byte-length into account.
# TIP: put the cursor on the magic characters and press sequence g8 -
# you'll see the bytes constituting those glyphs.
#
export PS1='${PSpfx}${DEPTH# }'

## ort PS1="$PS1"'${BRANCH:+\['"$(tput setaf 6; tput bold)"'\]«\[BR:\]$BRANCH»\['"$(tput sgr0)"' \]}'
export PS1="$PS1"'${BRANCH:+\['"$(tput setaf 6; tput bold)"'\]<BR:$BRANCH>\['"$(tput sgr0)"'\]}${HOSTNAME:+\['"$(tput setaf 6; tput bold)"'\]@'"$(hostname -s)"'\['"$(tput sgr0)"'\]} '

export PS1="$PS1"'${PROJECT:+\['"$(tput setaf 6; tput bold)"'\]$PROJECT\['"$(tput sgr0)"'\]}'

## ort PS1="$PS1"'\['"$(tput setaf 6)"'\]${APPL_SUBDIR-\w}\[ \]▬▶\['"$(tput sgr0)"' \]'
export PS1="$PS1"'\['"$(tput setaf 6)"'\]${APPL_SUBDIR-\w} =>\['"$(tput sgr0)"'\] '

