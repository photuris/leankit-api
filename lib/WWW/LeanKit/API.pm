package WWW::LeanKit::API;

use warnings;
use strict;
use version;
use JSON::Any;
use LWP::UserAgent;
use Carp qw( croak );

our $VERSION = qv( '0.0.1' );

our @namespaces = (
	'Archive', 'Backlog', 'Board', 'Card', 'Config'
);

=head1 NAME

WWW::LeanKit::API - Access LeanKit's REST API with Perl

=head1 METHODS

=over 4

=item B<new()>

Instantiate class.

=cut

sub new {
	my $class = shift;
	my %args  = @_;
	my $self  = {};

	for my $key (keys %args) {
		$self->{$key} = $args{$key};
	}

	bless ( $self, $class );

	$self->{api_version} = $args{api_version} || $self->_api_version();
	$self->{username}    = $args{username}    || '';
	$self->{password}    = $args{password}    || '';
	$self->{account}     = $args{account}     || '';
	$self->{base_url}    = "http://$self->{account}.leankitkanban.com/Kanban/Api/";

	return $self;
}

=item B<_api_version()>

Returns the working API version.

returns: scalar {String} The API version

=cut

sub _api_version {
	return qv( '1.0' );
}

=back

=cut

1;

__END__

=head1 AUTHOR

Joshua Pruitt, E<lt>firefly777+perl@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2013 by Joshua Pruitt

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.1 or,
at your option, any later version of Perl 5 you may have available.

=cut
