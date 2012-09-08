SpotifyScrapeAndDownload
========================

General:
This repo contains a perl script that converts a spotify uri to a playlist of tracks and artists
A shell scripts that gives the most likely youtube url for a given query
And a shell script that combines the two and downloads all songs from a spotify uri via youtube

Requirements:
make sure to have perl installed
if not installed: sudo cpan install Web:Scraper
check if spot2mp3.sh, ytlikely.sh and spotify-scrape.pl are in the same folder
install youtube-dl: sudo apt-get install youtube-dl

Example call:
sh ./spot2mp3.sh 'spotify:track:1iNeZGJsoC0D7ZyJTdIbDS' 'DaftPunkTechnoLogic'
sh ./spot2mp3.sh 'spotify-uri' 'foldername'

special thanks to: Jonathan Spruytte - http://twitter.com/spruyttej

Notes:
All scripts can be used seperatly.

Use Policy:
spotify2mp3.sh should only be used in case the mobile version of spotify fails to work on your mobile phone.
Respect the artists you listen to, if you really like the song: buy/download it in spotify.

Legal Notice:
The Author is not responisble for any infringements made by the users of these script
