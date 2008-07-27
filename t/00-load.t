#!/usr/bin/env perl

use Test::More tests => 1;

BEGIN {
	use_ok( 'App::ZofCMS::Plugin::QueryToTemplate' );
}

diag( "Testing App::ZofCMS::Plugin::QueryToTemplate $App::ZofCMS::Plugin::QueryToTemplate::VERSION, Perl $], $^X" );
