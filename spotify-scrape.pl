#requirement
#if not installed: sudo cpan install Web:Scraper

#example call:
#perl ./spotify-scrape.pl 'spotify:track:2qpmEFEoc6bVpYhc4Lp5Uo'
#perl ./spotify-scrape.pl 'spotify-uri'

#Author: Jonathan Spruytte
#Author twitter: http://twitter.com/spruyttej

#CoAuthor: Wouter Vandenneucker
#CoAuthor twitter: http://twitter.com/woutervddn


use strict;
use URI;
use Web::Scraper;

#init
my @songs=();
#scraper
my $data = scraper {
 # we will save the urls from the teams
 process "ul.track-info", "tracks[]" => scraper {
 	process "ul.track-info>li.track-title", 'title' => 'TEXT';
 	process "ul.track-info>li.artist", 'artist' => 'TEXT';
 };
};

#loop over infput
foreach ($ARGV[0]=~/(.*)/){

# scrape the data
my $res = $data->scrape(URI->new("https://embed.spotify.com/?uri=$_"));

#push(@songs,$res->{titles}[0] . " " . $res->{artists}[0]);


#print join("\n",@songs),"\n";
for my $track (@{$res->{tracks}}) {
      print "$track->{title} - $track->{artist} \n";
  }
}
