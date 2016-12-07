
# Del => moveleft Key Binding (ksh)

# if the erase key is set to DEL
if COLUMNS=20 stty -a | grep -q '^erase = ^?'; then
    # if not in edit mode, and the char is DEL, replace it
    trap $'[[ -z "${.sh.edmode}" && ${.sh.edchar} == "\177" ]] && .sh.edchar="\b"' KEYBD
fi

