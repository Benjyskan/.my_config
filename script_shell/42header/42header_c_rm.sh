#!/bin/sh

# while read line; do echo $line; done < tmp
#cat tmp | read line; echo $line

if [ $# != 1 ]
then
	echo enter 1 arg
	exit
fi
line="$(head -n 1 $1)"
short=${line:0:4}
#echo "$short"
if [ "$short" = "/* *" ]; then
	sed -i".bak" '1,12d' $1
	echo deleted header
else
	echo no header found
fi
