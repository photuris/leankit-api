package WWW::LeanKit::API::Request;

use warnings;
use strict;
use Carp;

=head1 NAME

WWW::LeanKit::API::Request

=head1 METHODS

=over 4

=item B<all()>

Issues query against LeanKit API.

returns: ref JSON-decoded API response

=cut

sub get {
	my $self = shift;
	my ( $call ) = @_;

	my $request = HTTP::Request->new( GET => $self->base->{base_url} . $call );
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
