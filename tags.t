use strict;
use warnings;

use Pod::PseudoPod::DOM;

my $file   = "=head3 c heading
Diacritics are more difficult E<aacute> la the naE<iuml>ve attachE<egrave> and the E<copy> caper, E<plusmn> some constant.  FranE<ccedilla>aise has some fun ones.";
my $parser   = Pod::PseudoPod::DOM->new(
    formatter_role => 'Pod::PseudoPod::DOM::Role::LaTeX'
);
$parser->parse_string_document( $file );
my $doc  = $parser->get_document;
my $text = $doc->emit;

exit;
