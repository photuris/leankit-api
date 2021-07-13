Perl wrapper for LeanKit Kanban API
===================================

```perl
    #!/usr/bin/env perl

    use strict;
    use warnings;
    use WWW::LeanKit::API;

    my $api = WWW::LeanKit::API->new(
      username => 'email@host.com',
      password => 'supersecret',
      account  => 'organization'    # <account>.leankit.com
    );

    # Fetch Board details
    my $board = $api->board->find(1111);

    # Fetch Card details
    my $card = $api->card->find(1111, 2222);

    print $card->{Title} . "\n";

    # Update Card details
    $api->card->update(1111, $card, {
      Title => 'A New Title for this Card'
    });
 ```
