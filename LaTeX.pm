package LaTeX;

my %characters = (
    acute => sub {
        qq|\\'| . shift
    },
    grave => sub {
        qq|\\`| . shift;
    },
);

sub emit_character {
    $characters{'acute'}->( 'a' );
    $characters{'grave'}->( 'a' );
}

1;
