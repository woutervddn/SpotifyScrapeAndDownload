#example call:
#sh ./ytlikely.sh 'daft+punk+technologic'
#sh ./ytlikely.sh 'search+term'

#Author: Wouter Vandenneucker
#Author twitter: http://twitter.com/woutervddn

QUERY=$(echo $1 | sed -e 's/ - / /g' | sed 's/ /+/g')
wget  -O foo.html "http://gdata.youtube.com/feeds/api/videos?q=$QUERY&max-results=1&v=2"&&
RESPONSE=$(cat foo.html)
rm foo.html
echo $RESPONSE | sed 's/></>\n</g' | grep 'media:player' | sed "s/<media:player url='//g" |sed "s/'\/>//g"

