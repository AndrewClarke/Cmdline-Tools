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

NOTE: you will need to get your SSH keys in ~/.ssh sorted out...


SETTING UP CENTOS 7

    sudo yum update
    sudo yum install epel-release
    sudo yum remove mariadb

Follow the instructions on https://dev.mysql.com/doc/mysql-repo-excerpt/5.6/en/linux-installation-yum-repo.html
to add the appropriate MySQL community repository for your current version of Centos or RHEL

    sudo yum install gvim vimdiff git-gui libxml2-devel libxslt-devel ImageMagick ImageMagick-devel
    sudo yum install ncurses-devel mysql-community-server mysql-workbench-community
    sudo yum update

    yum install dkms  # may be needed to build virtualbox additions IF inside a VM!

NOTE: There is also a strong chance that you'll need to run

    sudo mysql_secure_installation

but ensure you set root to no password and access from localhost only, to suit the default needs of Tickit development.


SETTING UP UBUNTU

For Ubuntu:

    $ sudo apt-get update
    $ sudo apt-get install mysql-server build-essential
    $ sudo apt-get install git git-gui gitk curl libmysqlclient-dev
    $ sudo apt-get install bison openssl libreadline6 libreadline6-dev zlib1g
    $ sudo apt-get install zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev
    $ sudo apt-get install autoconf libc6-dev ncurses-dev automake
 
  
    # For Ubuntu >= 12.10
    $ sudo apt-get install libmagickwand-dev
    # Otherwise
    $ sudo apt-get install libmagick++9-dev


For Centos 7 or RHEL 7:

    $ sudo yum install epel-release

Follow the instructions on https://dev.mysql.com/doc/mysql-repo-excerpt/5.6/en/linux-installation-yum-repo.html to add the appropriate MySQL community repository for your current version of Centos or RHEL

    $ sudo yum install gvim vimdiff git-gui libxml2-devel libxslt-devel ImageMagick ImageMagick-devel
    $ sudo yum install ncurses-devel mysql-community-server mysql-workbench-community
    $ sudo yum update

NOTE: There is also a strong chance that you'll need to run

    sudo mysql_secure_installation

but ensure you set root to no password and access from localhost only, to suit the default needs of Tickit development.



MY PC IS NOT A PHONE and other annoyances

    gsettings set org.gnome.desktop.session idle-delay 0

    plymouth-set-default-theme details
    dracut -f

Then reboot.

Annoying wait during booting:

    systemctl mask NetworkManager-wait-online.service



SUDO improvements

    Defaults    env_keep += "ORIGIN_SITE ORIGIN_USER ORIGIN_HOST"
    # TODO: limit the following to speshul-person
    Defaults    env_keep += "SSH_AGENT_PID SSH_AUTH_SOCK SSH_ASKPASS"



RVM stuffs

    rvm --default use jruby-1.7
    rvm @global do rvm INSTALL GEMS TO BE SHARED BY ALL GEMSETS

creating gemsets

    rvm 2.1.1
    rvm gemset create teddy rosie

using one

    rvm gemset use teddy

setting one as the default (per interpreter)

    rvm use 2.1.1@teddy --default



Setting credentials for RubyGems.org

    bundle config https://rubygems.org/ AndrewClarke:'PASSWORD'

NOTE: the password (and username!) needs to be CGI-escaped eg &#22 for fugly characters


BUILDING Unicon

    svn checkout http://svn.code.sf.net/p/unicon/code/trunk/unicon

    sudo yum install libX11-devel

\*-develop packages for:

    opengl
    libz
    libjpeg
    libpng
    ogg/vorbis
    sdl
    ftgl
    and others.

Unfortunately, the names of packages change over time and between distributions. If you are having trouble finding the right package, you can e-mail the unicon-group mailing list for advice. For 3D OpenGL capabilities, see also this OpenGL reference for advice on Linux.

Expand the bundle, and then add it's bin directory to $PATH

    make Configure name=x86_64_linux    # use your OS name from config/unix
-or-
    make X-Configure name=x86_64_linux  # if you have X11 libs/headers
+
    make Unicon


