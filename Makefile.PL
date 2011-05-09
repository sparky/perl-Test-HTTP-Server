use strict;
use ExtUtils::MakeMaker;

# older perl seems to choke on it, maybe utf8::upgrade would work ?
my $l_ = $] >= 5.010 ? "ł" : "l";
WriteMakefile(
	NAME 		=> 'Test::HTTP::Server',
	VERSION_FROM	=> 'lib/Test/HTTP/Server.pm',
	ABSTRACT_FROM	=> 'lib/Test/HTTP/Server.pm',
	AUTHOR		=> "Przemys${l_}aw Iskra <sparky at pld-linux.org>",
	META_MERGE	=> {
	},
	SIGN		=> 1,
	LICENSE		=> 'perl',
	CONFIGURE_REQUIRES => {
		"ExtUtils::MakeMaker" => 0,
	},
	PREREQ_PM => {
		"Test::More" => 0,
	},
	META_MERGE	=> {
		resources => {
			repository => 'https://github.com/sparky/perl-Test-HTTP-Server'
		},
	},
	DIR			=> [], # no other Makefile.PL
);

# vim: ts=4:sw=4
