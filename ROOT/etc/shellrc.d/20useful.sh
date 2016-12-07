:

# Some useful functions
#
startx() {
    test -x /usr/X11R6/bin/startx || {
	echo "No startx installed" 1>&2
	return 1;
    }
    /usr/X11R6/bin/startx ${1+"$@"} 2>&1 | tee $HOME/.X.err
}

remount() { /bin/mount -o remount,${1+"$@"}; }

