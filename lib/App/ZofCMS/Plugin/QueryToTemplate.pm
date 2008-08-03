package App::ZofCMS::Plugin::QueryToTemplate;

use warnings;
use strict;

our $VERSION = '0.0102';

sub new { bless {}, shift; }

sub process {
    my ( $self, $template, $query, $config  ) = @_;
    
    keys %$query;
    while ( my ( $key, $value ) = each %$query ) {
        $template->{t}{"query_$key"} = $value;
    }
    
    return;
}

1;
__END__

=head1 NAME

App::ZofCMS::Plugin::QueryToTemplate - ZofCMS plugin to automagically make query parameters available in the template

=head1 SYNOPSIS

In your ZofCMS template, or in your main config file (under C<template_defaults>
or C<dir_defaults>):

    plugins => [ qw/QueryToTemplate/ ];

In any of your L<HTML::Template> templates:

    <tmpl_var name="query_SOME_QUERY_PARAMETER_NAME">

=head1 DESCRIPTION

Plugin can be run at any priority level and it does not take any input from
ZofCMS template.

Upon plugin's execution it will stuff the C<{t}> first level key (see
L<App::ZofCMS::Template> if you don't know what that key is) with all
the query parameters as keys and values being the parameter values. Each
query parameter key will be prefixed with C<query_>. In other words,
if your query looks like this:

    http://foo.com/index.pl?foo=bar&baz=beerz

In your template parameter C<foo> would be accessible as C<query_foo>
and parameter C<baz> would be accessible via C<query_baz>

    Foo is: <tmpl_var name="query_foo">
    Baz is: <tmpl_var name="query_baz">

=head1 AUTHOR

Zoffix Znet, C<< <zoffix at cpan.org> >>
(L<http://zoffix.com>, L<http://haslayout.net>)

=head1 BUGS

Please report any bugs or feature requests to C<bug-app-zofcms-plugin-querytotemplate at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=App-ZofCMS-Plugin-QueryToTemplate>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc App::ZofCMS::Plugin::QueryToTemplate

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-ZofCMS-Plugin-QueryToTemplate>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/App-ZofCMS-Plugin-QueryToTemplate>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/App-ZofCMS-Plugin-QueryToTemplate>

=item * Search CPAN

L<http://search.cpan.org/dist/App-ZofCMS-Plugin-QueryToTemplate>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2008 Zoffix Znet, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

