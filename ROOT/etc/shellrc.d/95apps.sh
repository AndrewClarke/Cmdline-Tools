
alias mast='cd `obj -p master`'
alias mine='cd `obj`'

# Setup the jump to release project program directory aliases
#
for i in $(/bin/ls -d /sand/devel/auth_+([0-9])_+([0-9]) | cut -d/ -f4); do
    j=${i##auth_}
    j=${j//_/}
    alias $j='cd `obj -p '$i'`'
done

# Setup the btci and authbld release aliases
#

for i in $(/bin/ls -rd /sand/devel/auth_+([0-9])_+([0-9]) | cut -d/ -f4); do
        j=${i##auth_}
        j=${j//_/}
        [ -z "$cis" ] && cis="-r$i" || cis="$cis -r$i"
        [ -z "$blds" ] && blds="mast && authbld && $j && authbld" || blds="$blds && $j && authbld"
        alias btci$j="btci -u $cis"
        alias authbld$j="$blds"
done
unset blds cis

alias ifx='. ifx'
alias ora='. ora'

alias  gdoit='env FGLSERVER=$FGLSERVER:100 doit'
alias gdebug="env FGLSERVER=$FGLSERVER:100 wacrun -d"

# this should be well and truly obsolete now.
export NOWCCS=1

