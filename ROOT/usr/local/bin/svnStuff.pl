#!/usr/bin/perl

use IPC::Open3;

open3(JFD, SFD, SFD, qw(svn info)) or die "cannot open pipeline from svn info: $!\n";
while(<SFD>) {
    $root = $1 if /^Repository Root: (.*)/;
    $url = $1 if /^URL: (.*)/;
}

$path = substr $url, length $root;
# TorBorT = Trunk or Branch or Tag - GEDDIT?
($proj, $TorBorT, $bit, $dir) = $path =~ m!/([^/]*)/(?:(?:(branches|tags)/([^/]*))|trunk)(.*)!;

$branch = $bit if $TorBorT eq 'branches';
$tag = $bit if $TorBorT eq 'tags';

foreach ($root, $url, $path, $proj, $branch, $tag, $dir) {
    s/(['"`\\])/\\$1/g;
    s/^/"/;
    s/$/"/;
}

print "export SVNROOT=$root;\n";
print "export SVNURL=$url;\n";
print "export SVNPATH=$path;\n";
print "export SVNPROJ=$proj;\n";
print "export SVNBRANCH=$branch;\n";
print "export SVNTAG=$tag;\n";
print "export SVNDIR=$dir;\n";

__END__

typical raw values from svn info:

  in a branch
    URL: https://ausvn.civica.com.au/svnroot/wacgen/branches/multi-dialog/source
    Repository Root: https://ausvn.civica.com.au/svnroot

  in the trunk
    URL: https://ausvn.civica.com.au/svnroot/wacgen/trunk/source
    Repository Root: https://ausvn.civica.com.au/svnroot

