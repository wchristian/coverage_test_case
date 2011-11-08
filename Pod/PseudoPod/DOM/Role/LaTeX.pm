package Pod::PseudoPod::DOM::Role::LaTeX;
# ABSTRACT: an LaTeX formatter role for PseudoPod DOM trees

use strict;
use warnings;

use Moose::Role;

requires 'type';
has 'tables',            is => 'rw', default => sub { {} };
has 'filename',          is => 'ro', default => '';
has 'emit_environments', is => 'ro', default => sub { {} };

my %characters = (
    acute   => sub { qq|\\'| . shift },
    grave   => sub { qq|\\`| . shift },
    uml     => sub { qq|\\"| . shift },
    cedilla => sub { '\c' },              # ccedilla
    opy     => sub { '\copyright' },      # copy
    dash    => sub { '---' },             # mdash
    lusmn   => sub { '\pm' },             # plusmn
    mp      => sub { '\&' },              # amp
);

sub emit_character
{
    my $content = "aacute";

    if (my ($char, $class) = $content =~ /(\w)(\w+)/)
    {
        return $characters{$class}->($char) if exists $characters{$class};
    }
}

1;
