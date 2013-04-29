package WWW::LeanKit::API::Backlog;

use warnings;
use strict;
use Carp;

=head1 NAME

WWW::LeanKit::API::Backlog

=head1 METHODS

=over 4

=item B<fetch()>

Find backlog by specified Board ID.

param: scalar {Integer} Board ID

returns: ref {Array} The backlog

=cut

sub fetch {
	my $self = shift;
	my ( $board_id ) = @_;

	return $self->base->request->get("/Board/$board_id/Backlog");
}

=back

=cut

1;

__END__
