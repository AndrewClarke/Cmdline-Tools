
set -a


FCODE=2.30.05
GCODE=2.30.05
APPL=/opt/devel/master/auth
FGLDIR=/opt/fgl-$FCODE
GDCDIR=/opt/gdc-$GCODE

APP_CLASS=auth
APP_RELEASE=6.4

DBCENTURY=C
DBDATE=dmy4/
DBEDIT=vi
applibext=4gs
waclibext=aut
ICON=/opt/unicon-11.7
cust_path=$applibext
link_path=$waclibext:4gs

wacgen=/opt/wacgen/tools-trunk
wacgenlib=/opt/wacgen/lib-trunk

IPATH=$wacgen/source/iconlib
FGLDBPATH=$APPL/schema

DBPATH=:$wacgenlib/gforms.$waclibext:$wacgenlib/forms.$waclibext:$APPL/all.4gm/lib2.4gs:$APPL/FourJs/resources

FGLLDPATH=
FGLLDPATH=$FGLLDPATH:$FGLDIR/lib
FGLLDPATH=$FGLLDPATH:$APPL/bin/LINUX-x86
FGLLDPATH=$FGLLDPATH:../lib.$applibext
FGLLDPATH=$FGLLDPATH:$APPL/all.4gm/lib1.$applibext
FGLLDPATH=$FGLLDPATH:$APPL/all.4gm/lib2.$applibext
FGLLDPATH=$FGLLDPATH:$wacgenlib/gforms.$waclibext
FGLLDPATH=$FGLLDPATH:$wacgenlib/genero.$waclibext
FGLLDPATH=$FGLLDPATH:$wacgenlib/scr.$waclibext
FGLLDPATH=$FGLLDPATH:$wacgenlib/user_ctl.$waclibext
FGLLDPATH=$FGLLDPATH:$wacgenlib/standard.$waclibext
FGLLDPATH=$FGLLDPATH:$wacgenlib/report.$waclibext
FGLLDPATH=$FGLLDPATH:$wacgenlib/stubs.$waclibext

PATH=$wacgen/bin:$wacgen/bin.local:$wacgen/bin.port:$APPL/bin:$FGLDIR/bin:$GDCDIR/bin:$PATH

LD_LIBRARY_PATH=/opt/fgl\-2.30.05/dbdrivers:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=$INFORMIXDIR/lib:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=$INFORMIXDIR/lib/cli:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=$INFORMIXDIR/lib/esql:$LD_LIBRARY_PATH

FGLPROFILE=$FGLDIR/etc/fglprofile
FGLPROFILE=$APPL/FourJs/etc/fglprofile.auid

set -a

