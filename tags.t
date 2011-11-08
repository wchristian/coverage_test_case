use strict;
use warnings;

use TestDOM 'Pod::PseudoPod::DOM::Role::LaTeX';
use File::Slurp;
use Pod::PseudoPod::DOM;

my $file   = read_file( "test_file.pod" );
my $result = parse( $file );
exit;
