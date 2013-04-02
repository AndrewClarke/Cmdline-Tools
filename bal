#!/usr/bin/env perl

use strict;
use warnings;
no warnings 'uninitialized';

use constant {
    ON => 0,   # being tricky, but it works... read it at face value
    OFF => undef
};

my ($state, $print, $first) = (OFF, OFF, OFF);

while(<>) {
    $first = $state = $print = ON if ! defined($state) && /\bdisplay_methods\b/g;

    if(defined $state) {
        $print = ON;

        LOOP: while(/\G.*?([][(){}])/g) {
            my $ch = $1;

            if($ch eq '}' || $ch eq ']' || $ch eq ')') {
                --$state;
                last LOOP if $state <= 0;
            }

            ++$state if $ch eq '{' || $ch eq '[' || $ch eq '(';
        }

        # The following assumes that the line recognising the keyword should
        # also have balancable characters ON the same line or it will switch off.
        # Sounds like a job for a command line switch when it is put into grep++
        #
        $state = OFF if $state <= 0;
    }

    if(defined $print) {
      print "\n*** $ARGV\[$.]:\n" if defined $first;
      print;
    }
    $first = $print = OFF;
}
continue {
    if(eof) {
        close ARGV;
        $first = $state = $print = OFF;
        reset;
    }
}

