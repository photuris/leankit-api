package WWW::LeanKit::API::Request;

use warnings;
use strict;

=head1 NAME

WWW::LeanKit::API::Request

=head1 METHODS

=over 4

=item B<get()>

Issues GET query against LeanKit API.

param: scalar {String} URL to call

returns: scalar {String} JSON-decoded API response

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

=item B<post()>

Issues POST query against LeanKit API.

param: scalar {String} URL to call

param: ref {Hash} Properties to POST

returns: scalar {String} JSON-decoded API response

=cut

sub post {
	my $self = shift;
	my ( $call, $data ) = @_;

	my $json = JSON::Any->new;

	my $encoded_data = ($data) ? $json->encode($data) : '{}';

	my $request = HTTP::Request->new( POST => $self->base->{base_url} . $call );
	   $request->authorization_basic( $self->base->{username}, $self->base->{password} );
	   $request->header( 'Content-Type' => 'application/json' );
	   $request->content( $encoded_data );

	my $response = $self->base->{ua}->request($request);

	if ($response->code == 200) {
		return $json->decode($response->content)->{ReplyData}[0];
	}
}

=back

=cut

1;

__END__
