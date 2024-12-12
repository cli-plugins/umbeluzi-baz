#!/usr/bin/env perl

use strict;
use warnings;

=head1 NAME

umbeluzi-baz plugin - A dashboard plugin

=head1 VERSION

dev

=cut

# Check for required commands
sub check_command {
    my $cmd = shift;
    return system("which $cmd >/dev/null 2>&1") == 0;
}

sub parse_args {
    my %options = (debug => 0);
    
    foreach my $arg (@ARGV) {
        if ($arg eq '-v' || $arg eq '--version') {
            print "umbeluzi-baz version dev\n";
            exit 0;
        }
        elsif ($arg eq '--debug') {
            $options{debug} = 1;
        }
    }
    
    return \%options;
}

sub main {
    eval {
        my $options = parse_args();

        # Check for required commands
        unless (check_command('curl') && check_command('jq')) {
            die "Required: curl and jq\n";
        }

        # TODO: Replace with your implementation
        print "Hello from umbeluzi-baz plugin!\n";
    };
    if ($@) {
        print STDERR "Error: $@";
        exit 1;
    }
}

main(); 