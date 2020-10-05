:

alias o='less'
alias ..='cd ..'
alias ...='cd ../..'

alias -- +='pushd .'
alias -- -='popd'

alias rd=rmdir
alias md='mkdir -p'
alias which='type -p'
alias rehash='hash -r'
alias you='yast2 online_update'
alias beep='echo -en "\007"' 

alias unmount='echo "Error: Try the command: umount" 1>&2; false'

