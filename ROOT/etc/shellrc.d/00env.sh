:

UID=`id -ur 2> /dev/null`
GID=`id -gr 2> /dev/null`
EUID=`id -u  2> /dev/null`
EGID=`id -g  2> /dev/null`
GROUPS=`id -G 2> /dev/null`
USER=`id -un 2> /dev/null`
export UID GID EUID EGID GROUPS USER

