Cmdline-Tools
=============
Dumping ground for a bunch of useful command line tools.

The original need was to safely stash away grep++ (nee xgrep nee pgrep - sheesh all the good letters are taken)

Usage
=====
I prefer to check this out to $HOME/.BUCKET and then use symlinks
to refer to the files/directories from $HOME.

    cd ~
    git clone https://github.com/AndrewClarke/Cmdline-Tools.git .BUCKET
    cd .BUCKET
    ./mklinks
    # switch to preferred git (ssh) protocol
    git remote set-url origin git@github.com:AndrewClarke/Cmdline-Tools.git

