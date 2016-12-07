
unalias gvi gvim gview vi vim view

case "$_I_LIKE_VIM" in
  '')
    :
    ;;

  cream*)
    alias vi="cream"
    alias vim="cream"
    alias view="cream -R"
    ;;

  gvim*)
    alias vi="gvim"
    alias vim="gvim"
    alias view="gvim -R"
    ;;
esac

alias gvi="gvim"
alias gvim="gvim"
alias gview="gvim -R"

