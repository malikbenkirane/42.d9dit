#!/bin/sh

getlink()
{
	TARGET_URL="https://projects.intra.42.fr/piscine-c-day-09-$TARGET_ID/mine"
	sed "/'HIDDENPASSWORD'/s/HIDDENPASSWORD/$PASSWD/" script.js > .hidden.$1.js
	echo $TARGET_URL
	sed -e "/'USER_LOGIN'/s/USER_LOGIN/'$USER_LOGIN'/" -i '' .hidden.$1.js
	sed -e "/TARGET_ID/s/TARGET_ID/'$TARGET_ID'/" -i '' .hidden.$1.js
	sed -e "/TARGET_URL/s@TARGET_URL@'$TARGET_URL'@" -i '' .hidden.$1.js
	chmod 600 .hidden.$1.js
	# cat .hidden.$1.js
	$PWD/phantomjs .hidden.$1.js
	rm -f .hidden.$1.js
}

read -p 'Login: ' USER_LOGIN
read -p 'Password: ' -s PASSWD

SAVE=$(mktemp XXX)
mv $SAVE cdn-$SAVE.txt
SAVE=cdn-$SAVE.txt

for TARGET_ID in 00 01 02 03 04 05 06 07 08 09 10 \
	11 12 13 14 15 16 17 18 19 20 21 22 23
do
	getlink $TARGET_ID | grep cdn >> $SAVE &
done

echo "Wait (about 20 seconds) then watch $SAVE"
while fuser $SAVE 2>/dev/null | wc -c | tr -d ' ' | grep -v '^0$'
do
	echo ...
	sleep 3
done
