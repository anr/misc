#!/usr/bin/env perl

use strict;
use warnings;

sub process {
    my $number = <>;
    my ($entrance_to_exit, $exit_to_entrance);

    while (<>) {
        chomp;
        ($entrance_to_exit, $exit_to_entrance) = split;
        map_maze($. - 1, $entrance_to_exit, $exit_to_entrance);
    }
}

sub map_maze {
    my $number           = shift;
    my $entrance_to_exit = shift;
    my $exit_to_entrance = shift;

    my $params = {
        maze      => [],
        row       => -1,
        col       =>  0,
        direction => "S",
        path      => $entrance_to_exit,
    };

    map_path($params);

    $params->{path} = $exit_to_entrance;

    map_path($params);

    print_maze($number, $params->{maze});
}

sub map_path {
    my $p = shift;

    my %col_inc = (N =>  0, S => 0, W => -1, E => 1);
    my %row_inc = (N => -1, S => 1, W =>  0, E => 0);

    my %bit_repr = (N => 1, S => 2, W => 4, E => 8);

    my %opposite   = (N => "S", S => "N", W => "E", E => "W");
    my %left_turn  = (N => "W", S => "E", W => "S", E => "N");
    my %right_turn = (N => "E", S => "W", W => "N", E => "S");

    my @moves = split(//, $p->{path});

    for (my $i = 0; $i < @moves - 1; $i++) {
        if ($moves[$i] eq "W") {
            $p->{row} += $row_inc{$p->{direction}};
            $p->{col} += $col_inc{$p->{direction}};

            $p->{maze}[$p->{row}]{$p->{col}} |= $bit_repr{$opposite{$p->{direction}}};
        }
        elsif ($moves[$i] eq "R") {
            $p->{direction} = $right_turn{$p->{direction}};
        }
        elsif ($moves[$i] eq "L") {
            $p->{direction} = $left_turn{$p->{direction}};
        }

        $p->{maze}[$p->{row}]{$p->{col}} |= $bit_repr{$p->{direction}} if $moves[$i + 1] eq "W";
    }

    $p->{row} += $row_inc{$p->{direction}};
    $p->{col} += $col_inc{$p->{direction}};
    $p->{direction} = $opposite{$p->{direction}};
}

sub print_maze {
    my $number = shift;
    my $maze   = shift;

    print "Case #$number:\n";

    foreach my $row (@$maze) {
        foreach my $col (sort { $a <=> $b } keys %$row) {
            printf "%x", $row->{$col};
        }

        print "\n";
    }
}

process();
