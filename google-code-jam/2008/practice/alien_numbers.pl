#!/usr/bin/env perl

use strict;
use warnings;

sub process {
    my $number = <>;
    my $translation;

    while (<>) {
        chomp;
        $translation = translate(split);
        print "Case #" . ($. - 1) . ": $translation\n";
    }
}

sub translate {
    my $alien_number    = shift;
    my $source_language = shift;
    my $target_language = shift;

    my $number = to_system($alien_number, $source_language);
    my $translated_number = from_system($number, $target_language);

    return $translated_number;
}

sub to_system {
    my $alien_number    = shift;
    my $source_language = shift;

    my $base = length($source_language);

    my @alien_digits = split(//, $alien_number);

    my $digit;
    my $result = 0;

    for (my $i = 0; $i < @alien_digits; $i++) {
        $digit  = index $source_language, $alien_digits[$i];
        $result = $result * $base + $digit;
    }

    return $result;
}

sub from_system {
    my $number          = shift;
    my $target_language = shift;

    my $base = length($target_language);

    my $remainder;
    my $result = "";

    do {
        $remainder = $number % $base;
        $number    = int($number / $base);

        $result .= substr($target_language, $remainder, 1);
    } until ($number == 0);

    return reverse $result;
}

process();
