use strict;
use warnings;

use File::Slurp;
use Pod::PseudoPod::DOM;

my $file   = read_file( "test_file.pod" );
my $parser   = Pod::PseudoPod::DOM->new(
    formatter_role => 'Pod::PseudoPod::DOM::Role::LaTeX'
);
$parser->parse_string_document( $file );
my $doc  = $parser->get_document;
my $text = $doc->emit;

exit;
