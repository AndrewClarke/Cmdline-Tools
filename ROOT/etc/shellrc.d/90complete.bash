:

case "$BASH_VERSION" in
  [2-9].*)
    if test -e $HOME/.bash_completion
      then . $HOME/.bash_completion
    elif test -e /etc/bash_completion
      then . /etc/bash_completion
    fi

    for s in /etc/bash_completion.d/*.sh; do
	test -r $s && . $s
    done
    ;;
esac
