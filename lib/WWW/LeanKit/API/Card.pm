package WWW::LeanKit::API::Card;

use warnings;
use strict;
use Carp;

=head1 NAME

WWW::LeanKit::API::Card

=head1 METHODS

=over 4

=item B<find()>

Find a card by specified Board ID and Card ID.

param: scalar {Integer} Board ID

param: scalar {Integer} Card ID

returns: ref {Hash} The card

=cut

sub find {
	my $self = shift;
	my ( $board_id, $card_id ) = @_;

	return $self->base->request->get("/Board/$board_id/GetCard/$card_id");
}

=item B<delete()>

Delete a card by specified Board ID and Card ID.

param: scalar {Integer} Board ID

param: scalar {Integer} Card ID

returns: scalar {Hash} Status code

=cut

sub delete {
	my $self = shift;
	my ( $board_id, $card_id ) = @_;

	return $self->base->request->get("/Board/$board_id/DeleteCard/$card_id");
}

=item B<find_by_external_id()>

Find a card by specified Board ID and External ID.

param: scalar {Integer} Board ID

param: scalar {Integer} External ID

returns: ref {Hash} The card

=cut

sub find_by_external_id {
	my $self = shift;
	my ( $board_id, $external_id ) = @_;

	return $self->base->request->get("/Board/$board_id/GetCardByExternalId/$external_id")->[0];
}

=item B<update()>

Updates a card by specified Board ID and External ID.

param: scalar {Integer} Board ID

param: scalar {Integer} Card ID

param: ref {Hash} Card properties

returns: ref {Hash} The card

=cut

sub update {
	my $self = shift;
	my ( $board_id, $card_id, $properties ) = @_;

	$properties->{Id} = $card_id;

	return $self->base->request->post("/Board/$board_id/UpdateCard", $properties);
}

=back

=cut

1;

__END__
