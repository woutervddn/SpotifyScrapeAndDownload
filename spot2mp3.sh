#requirements
#make sure to have perl installed
#if not installed: sudo cpan install Web:Scraper
#check if spot2mp3.sh, ytlikely.sh and spotify-scrape.pl are in the same folder
#install youtube-dl: sudo apt-get install youtube-dl

#example call:
#sh ./spot2mp3.sh 'spotify:track:1iNeZGJsoC0D7ZyJTdIbDS' 'DaftPunkTechnoLogic'
#sh ./spot2mp3.sh 'spotify-uri' 'foldername'

#Author: Wouter Vandenneucker
#Author twitter: http://twitter.com/woutervddn

#special thanks to: Jonathan Spruytte - http://twitter.com/spruyttej


echo "saving playlist $1 in $2"
TITLE="$(wget --quiet -O - https://embed.spotify.com/?uri=$1 \ | sed -n -e 's!.*<title>\(.*\)</title>.*!\1!p')"
#echo "downloading $TITLE"
perl ./spotify-scrape.pl $1 > $2.sptlst
#echo "$TITLE downloaded as $2"
cat $2.sptlst | sed -e 's/.*\. //' > $2.spt2mp3
IFS="
"
for line in `cat file.spt2mp3`;do
	#echo "downloading: $line"
	link="$(sh ./ytlikely.sh $line)"
	#echo "from url: $link"
	mkdir $2
	cd ./$2
	youtube-dl -t -f 18 --extract-audio --audio-format "mp3" $link
	cd ../
done
rm $2.sptlst $2.spt2mp3
