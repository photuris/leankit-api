package WWW::LeanKit::API::Board;

use warnings;
use strict;
use Carp;

=head1 NAME

WWW::LeanKit::API::Board

=head1 METHODS

=over 4

=item B<all()>

Find all boards to which the specified user has access.

returns: ref {Array} List of boards

=cut

sub all {
	my $self = shift;

	my $request = HTTP::Request->new( GET => $self->base->{base_url} . 'Boards/' );
	   $request->authorization_basic( $self->base->{username}, $self->base->{password} );

	my $response = $self->base->{ua}->request($request);

	if ($response->code == 200) {
		my $json = JSON::Any->new;

		return $json->decode($response->content)->{ReplyData}[0];
	}
}

=back

=cut

1;

__END__
