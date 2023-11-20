path="somervillema"
url="http://data.somervillema.gov"
IDS="ids/somervillema_ids.txt"
mkdir -p $path

cat $IDS | while read LINE
do
	if [ ! -f $path/$LINE.csv ]
	then
		wget -t 1 --output-document=$path/$LINE.csv --timeout=10 "$url/api/views/$LINE/rows.csv?accessType=DOWNLOAD"
	fi
done
