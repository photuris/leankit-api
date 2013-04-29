package WWW::LeanKit::API;

use warnings;
use strict;
use version;
use JSON::Any;
use LWP::UserAgent;
use LWP::Protocol::https;
use Carp qw( croak );

our $VERSION = qv( '1.0.0' );

=head1 NAME

WWW::LeanKit::API - Access LeanKit's REST API with Perl

=cut

our @namespaces = (
	'Archive', 'Backlog', 'Board', 'Card', 'Request'
);

# Load up namespaces
for (@namespaces) {
	my $package = __PACKAGE__ . "::$_";
	my $name    = "\L$_";

	# no critic
	my $namespace = eval qq(
		use $package;

		sub $name {
			my \$self = shift;

			unless ( \$self->{_$name} ) {
				\$self->{_$name} = $package->new( base => \$self );
			}

			return \$self->{_$name};
		}

		package $package;

		sub base { return shift->{base}; };

		sub new {
			my ( \$class, \%args ) = \@_;
			my \$self = bless \\\%args, \$class;

			\$self->\$_ for keys %{\$self};

			return \$self;
		};

		1;
	);

	croak "Cannot create namespace $name: $@\n"
		if not $namespace;
}

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

	$self->{username} = $args{username}    || '';
	$self->{password} = $args{password}    || '';
	$self->{account}  = $args{account}     || '';
	$self->{base_url} = "https://$self->{account}.leankitkanban.com/Kanban/Api/";

	$self->{ua} ||= LWP::UserAgent->new(
		agent => 'perl-WWW-LeanKit-API/$VERSION'
	);

	return $self;
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
