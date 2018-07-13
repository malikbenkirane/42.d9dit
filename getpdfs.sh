#!/bin/sh

DST=merge-$(date +%H%M%S)
mkdir $DST
mv cdn-*.txt $DST

cd $DST
cat cdn-*.txt | sort | uniq > links.txt
for link in `cat links.txt`
do
	curl -O $link
done

cd ..
