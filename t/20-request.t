#
#
use Test::More tests => 6;
use Test::HTTP::Server;
use POSIX qw(SIGCHLD);
use IO::Socket;
use IO::Select;

my $server = Test::HTTP::Server->new;

alarm 5;

my $uri = $server->uri;
$uri =~ m{http://(.*?:\d+)/};

my $socket = IO::Socket::INET->new(
	PeerAddr => $1,
	Proto => 'tcp',
);

my $sel = IO::Select->new( $socket );
my @ready;

ok( !$sel->can_read( 0.1 ), 'nothing to read' );
ok( $sel->can_write( 1 ), 'can write' );

print $socket "GET / HTTP 1.0\r\n\r\n";

ok( $sel->can_read( 1 ), 'can read' );

$/ = undef;
my $resp = <$socket>;

ok( $sel->can_read( 1 ), 'looks closed' );
ok( !<$socket>, 'is closed' );

like( $resp, qr#^HTTP.*NONE$#s, 'got complete response' )
