package Pod::PseudoPod::DOM::Role::LaTeX;
# ABSTRACT: an LaTeX formatter role for PseudoPod DOM trees

use strict;
use warnings;

use Moose::Role;

requires 'type';
has 'tables',            is => 'rw', default => sub { {} };
has 'filename',          is => 'ro', default => '';
has 'emit_environments', is => 'ro', default => sub { {} };

use constant { BEFORE => 0, AFTER => 1 };
my $escapes = "commandchars=\\\\\\{\\}";

my %parent_items =
(
    text_list      => [ qq|\\begin{description}\n\n|,
                        qq|\\end{description}|                          ],
    bullet_list    => [ qq|\\begin{itemize}\n\n|,
                        qq|\\end{itemize}|                              ],
    number_list    => [ qq|\\begin{enumerate}\n\n|,
                        qq|\\end{enumerate}|                            ],
     map { $_ => [ qq|\\begin{$_}\n|, qq|\\end{$_}\n\n| ] }
         qw( epigraph blockquote )
);

while (my ($tag, $values) = each %parent_items)
{
    my $sub = sub
    {
        my $self = shift;
        return $values->[BEFORE]
             . $self->emit_kids( @_ )
             . $values->[AFTER] . "\n\n";
    };

    do {
        no strict 'refs';
        *{ 'emit_' . $tag } = $sub;
    };
}

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
