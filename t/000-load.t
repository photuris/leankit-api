use Test::More qw( no_plan );

BEGIN {
	use_ok('WWW::LeanKit::API');

	for (@WWW::LeanKit::API::namespaces) {
		use_ok("WWW::LeanKit::API::$_");
	}
}

diag("Testing WWW::LeanKit::API $WWW::LeanKit::API::VERSION");
