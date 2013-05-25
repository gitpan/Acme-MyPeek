package Acme::MyPeek;

use strict;
use warnings;

use B qw(svref_2object class);

require Exporter;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(hi hd dt);
our @EXPORT_OK = qw();
our $VERSION   = '0.02';

sub hi { highval( sub{ $_[0]                 eq sprintf('%u',  $_[0])      }); }
sub hd { highval( sub{ sprintf('%.f', $_[0]) ne sprintf('%.f', $_[0] - 1)  }); }
sub dt { class(svref_2object(\$_[0]));                                 }

sub highval {
    my ($ok) = @_;

    my $x = 1;
    my $f = 1;

    for (1..100) {
        my $y = $x * 10;

        unless ($ok->($y)) {
            $f = 0;
            last;
        }

        $x = $y;
    }

    return 0 if $f;

    my $r = $x;

    for (1..1000) {
        my $y = $x + $r;

        unless ($ok->($y)) {
            if ($r <= 1) {
                $r = 0;
                last;
            }

            $r /= 10;
            next;
        }

        $x += $r;
    }

    return 0 if $r;

    return $x
}

1;

__END__

=head1 NAME

Acme::MyPeek - Peek into the internal number representation

=head1 SYNOPSIS

    use Acme::MyPeek;

    print "no of bits integers..: ", log(hi) / log(2), "\n";
    print "no of bits floats ...: ", log(hd) / log(2), "\n";
    print "data type for int....: ", dt(3),            "\n";
    print "data type for float..: ", dt(3.1),          "\n";
    print "data type for char...: ", dt('z'),          "\n";

=head1 AUTHOR

Klaus Eichner <klaus03@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009-2013 by Klaus Eichner

All rights reserved. This program is free software; you can redistribute
it and/or modify it under the terms of the artistic license 2.0,
see http://www.opensource.org/licenses/artistic-license-2.0.php

=cut
