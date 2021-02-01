#!/usr/bin/perl -w
#
# Configure script to configure nusigma
# NOTE. Run this script before compiling nusigma (done automatically
# with a make in the nusigma root directory)
#
# Author: Joakim Edsjo, edsjo@physto.se
# Date: November 23, 2005
# Modifed JE 2016-04-25 to use parameters instead of data for root directory

$nurootfile="inc/nuroot.f";
$nuverfile="inc/nuver.f";

$nuroot=shift;
$nuroot =~ s#/$##;   # take away final / if any

$nuver = $nuroot;
$nuver =~ s#^.*/##;

# Add revision number to nusigma
$rev="";
if (open(IN,"svn info|")) {
    while(defined($line=<IN>)) {
	if ($line =~ /^Revision:\s+(\d+)$/) {
	    $rev=" @ rev $1";
	}
    }
    close(IN);
} else {
    print "Couldn't invoke svn. No revision number added to version tag.\n";
}

$nuver = "nusigma (" . $nuver . $rev . ")";

print "nusigma version: $nuver\n";


# Take care of nuversion file.
open(IN,"$nuverfile") || die "Can't open $nuverfile for reading.\n";
$line="";
while ($in=<IN>) {
    $line .= $in;
}
close(IN);

$newline=" " x 6 . "data nuversion/'$nuver'/\n";
$newline=contlinedata($newline);

if ($newline ne $line) {
    open(OUT,">$nuverfile") || 
      die "Can't open $nuverfile for writing\n";
    print OUT $newline;
    close(OUT);
    print "$nuverfile updated.\n";
} else {
    print "$nuverfile is up-to-date.\n";
}

# Take care of nusigma root directory file
open(IN,"$nurootfile") || die "Can't open $nurootfile for reading.\n";
$line="";
while ($in=<IN>) {
    $line .= $in;
}
close(IN);

$len = length($nuroot);
$line1 = " " x 6 . "character*${len} nuinstall\n";
$line2 = " " x 6 . "parameter(nuinstall='${nuroot}')\n";
$line2 = contlinedata($line2);
$newline = $line1 . $line2;
#$newline=" " x 6 . "data nudir/'$nuroot/'/\n";
#$newline=contlinedata($newline);

if ($newline ne $line) {
    open(OUT,">$nurootfile") || 
      die "Can't open $nurootfile for writing\n";
    print OUT $newline;
    close(OUT);
    print "$nurootfile updated.\n";
} else {
    print "$nurootfile is up-to-date.\n";
}


### Split long lines

sub contline {
    my $line = $_[0];
    my $out;
    my $i;
 
    $out="";
    if (length($line) >= 71) {
        print "*** A too long line has been found. I will split it.\n";
        print "Line before: \n$line";
        while (length($line) >= 71) {
            for ($i=70; $i==20; $i--) {
                if (substr($line,$i,1) =~ m@(\*|\+|-|/)@ ) {
                    last;
                }
            }
            $out=$out . substr($line,0,$i-1) . "\n";
            $line = " " x 5 . "&  " . substr($line,$i-1)
        }
        $out = $out . $line;
        print "Line after: \n$out";
    } else {
        $out=$line;
    }
 
    return $out;
}

# The version below works better for data statements with character
# data. Should not be used for other continuation lines.

sub contlinedata {
    my $line=$_[0];
    my $out;
    my $i;
 
    $out="";
    if (length($line) >= 71) {
        print "*** A too long line has been found. I will split it.\n";
        print "Line before: \n$line";
        while (length($line) >= 71) {
            for ($i=70; $i==20; $i--) {
                if (substr($line,$i,1) =~ m@(\*|\+|-|/)@ ) {
                    last;
                }
            }
            $out=$out . substr($line,0,$i-1) . "'\n";
            $line = " " x 5 . "&  //'" . substr($line,$i-1)
        }
        $out = $out . $line;
        print "Line after: \n$out";
    } else {
        $out=$line;
    }
 
    return $out;
}
