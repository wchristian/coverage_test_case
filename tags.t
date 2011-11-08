use strict;
use warnings;

require LaTeX;

my %characters = (
    acute => sub {
        qq|\\'| . shift
    },
);

$characters{'acute'}->( 'a' );

exit;
