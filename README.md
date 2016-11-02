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


SETTING UP CENTOS 7

  sudo yum install epel-release

Follow the instructions on https://dev.mysql.com/doc/mysql-repo-excerpt/5.6/en/linux-installation-yum-repo.html
to add the appropriate MySQL community repository for your current version of Centos or RHEL

  sudo yum install gvim vimduff git-gui libxml2-devel libxslt-devel ImageMagick ImageMagick-devel
  sudo yum install ncurses-devel mysql-community-server mysql-workbench-community
  sudo yum update

  yum install dkms  # may be needed to build virtualbox additions IF inside a VM!

NOTE: There is also a strong chance that you'll need to run

  sudo mysql_secure_installation

but ensure you set root to no password and access from localhost only, to suit the default needs of Tickit development.

