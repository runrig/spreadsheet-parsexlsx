#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 4;

use Spreadsheet::ParseXLSX;
use Spreadsheet::ParseExcel;

my $wb = Spreadsheet::ParseXLSX->new->parse('t/data/bug-42.xlsx');
pass('Tgt path test file parses');

my $ws = $wb->worksheet(0);
pass('Got worksheet');

my $name = $ws->get_name();
ok( $name eq 'RTO', 'Got worksheet name');

my $cell = $ws->get_cell(1,1);
my $v = $cell->value();
ok( $v eq 'DATE', 'Got first cell' );

done_testing;
