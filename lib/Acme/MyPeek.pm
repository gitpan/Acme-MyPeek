package Acme::MyPeek;

use strict;
use warnings;

use B qw(svref_2object class);

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT    = qw();
our @EXPORT_OK = qw(High_Int High_Dbl DataType);
our $VERSION   = '0.01';

sub High_Int {
    my $x = 1;
    my $f = 1;

    for (1..100) {
        my $y = $x * 10;

        unless ($y eq sprintf('%d', $y)) {
            $f = 0;
            last;
        }

        $x = $y;
    }

    return 0 if $f;

    my $r = $x;

    for (1..1000) {
        my $y = $x + $r;

        unless ($y eq sprintf('%d', $y)) {
            if ($r<=1) {
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

sub High_Dbl {
    my $x = 1;
    my $f = 1;

    for (1..100) {
        my $y = $x * 10;

        if ($y == $y + 1 or $y == $y - 1) {
            $f = 0;
            last;
        }

        $x = $y;
    }

    return 0 if $f;

    my $r = $x;

    for (1..1000) {
        my $y = $x + $r;

        if ($y == $y + 1 or $y == $y - 1) {
            if ($r<=1) {
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

sub DataType {
    class(svref_2object(\$_[0]));
}

1;

__END__

=head1 NAME

Acme::MyPeek - Peek into the internal number representation

=head1 SYNOPSIS

    use Acme::MyPeek qw(High_Int High_Dbl DataType);

=head1 AUTHOR

Klaus Eichner <klaus03@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009-2013 by Klaus Eichner

All rights reserved. This program is free software; you can redistribute
it and/or modify it under the terms of the artistic license 2.0,
see http://www.opensource.org/licenses/artistic-license-2.0.php

=cut
