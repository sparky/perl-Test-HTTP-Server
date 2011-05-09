#
#
use Test::More tests => 2;
use Test::HTTP::Server;

my $server = Test::HTTP::Server->new;
ok( $server, 'server started' );
like( $server->uri, qr#^http://127\.0\.0\.1:\d+/$#, 'correct address' );
