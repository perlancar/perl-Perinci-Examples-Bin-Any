package Perinci::Examples::Bin::Any::Multi;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;

our %SPEC;

$SPEC{add} = {
    v => 1.1,
    summary => 'A function to add to ints',
    description => <<'_',

Just a dummy description. Just a dummy description. Yup, just a dummy
description. Just a dummy description. Just a dummy description. Yeah, just a
dummy description. Just a dummy description.

_
    args => {
        arg1 => {
            schema => 'int*',
            req => 1,
            pos => 0,
            cmdline_aliases => { a=>{} },
        },
        arg2 => {
            schema => 'int*',
            req => 1,
            pos => 1,
            cmdline_aliases => { b=>{} },
        },
    },
};
sub add {
    my %args = @_;

    # we need to do validation ourselves because P::C::Lite currently doesn't do
    # it for us.
    my $a1 = $args{arg1}; defined($a1) or return [400, "Please specify arg1"];
    $a1 =~ /\A[+-]?\d+\z/ or return [400, "Invalid arg1 (not an int)"];
    my $a2 = $args{arg2}; defined($a2) or return [400, "Please specify arg2"];
    $a2 =~ /\A[+-]?\d+\z/ or return [400, "Invalid arg2 (not an int)"];

    [200, "OK", $a1 + $a2];
}

$SPEC{subtract} = {
    v => 1.1,
    summary => 'A function to subtract to ints',
    description => <<'_',

This function also has result_naked and args_as set to array.

_
    args => {
        arg1 => {
            schema => 'int*',
            req => 1,
            pos => 0,
            cmdline_aliases => { a=>{} },
        },
        arg2 => {
            schema => 'int*',
            req => 1,
            pos => 1,
            cmdline_aliases => { b=>{} },
        },
    },
    # not yet supported by P::C::Lite
    #args_as => 'array',
    result_naked => 1,
};
sub subtract {
    my %args = @_;

    # we need to do validation ourselves because P::C::Lite currently doesn't do
    # it for us.
    my $a1 = $args{a1}; defined($a1) or die [400, "Please specify arg1"];
    $a1 =~ /\A[+-]?\d+\z/ or die [400, "Invalid arg1 (not an int)"];
    my $a2 = $args{a2}; defined($a2) or die [400, "Please specify arg2"];
    $a2 =~ /\A[+-]?\d+\z/ or die [400, "Invalid arg2 (not an int)"];

    $a1 - $a2;
}

# ABSTRACT: Functions to be used by peri-eg-multi-any
