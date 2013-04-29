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

	return $self->base->request->get('Boards');
}

=item B<find()>

Find a board by specified Board ID.

param: scalar {Integer} Board ID

returns: ref {Hash} The board

=cut

sub find {
	my $self   = shift;
	my ( $id ) = @_;

	return $self->base->request->get("Boards/$id");
}

=item B<get_identifiers()>

Find a identifiers for specified Board ID.

param: scalar {Integer} Board ID

returns: ref {Hash} The board identifiers

=cut

sub get_identifiers {
	my $self   = shift;
	my ( $id ) = @_;

	return $self->base->request->get("Board/$id/GetBoardIdentifiers");
}

=back

=cut

1;

__END__
