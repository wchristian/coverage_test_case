package LaTeX;

my %characters = (
    acute => sub {
        qq|\\'| . shift
    },
);

$characters{'acute'}->( 'a' );

sub make_module_visible_in_coverage {}

1;
