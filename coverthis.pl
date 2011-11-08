#!perl

use strict;
use warnings;

system( "cover -delete" );
system( "perl -MDevel::Cover tags.t" );
system( "cover" );
