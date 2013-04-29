package WWW::LeanKit::API::Archive;

use warnings;
use strict;
use Carp;

=head1 NAME

WWW::LeanKit::API::Archive

=head1 METHODS

=over 4

=item B<fetch()>

Find archive by specified Board ID.

param: scalar {Integer} Board ID

returns: ref {Hash} The archive

=cut

sub fetch {
	my $self = shift;
	my ( $board_id ) = @_;

	return $self->base->request->get("/Board/$board_id/Archive");
}

=back

=cut

1;

__END__
