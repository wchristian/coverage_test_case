#!perl

use strict;
use warnings;

=pod
    Plack/Session
    Plack/Request.pm
    Sub/Quote.pm
=cut

my @select = qw(
);

system( "cover -delete" );
system( "perl -MDevel::Cover" . ( @select ? "=-select," . join( ",", @select ) : "" ) . " tags.t" );
system( "cover" );
