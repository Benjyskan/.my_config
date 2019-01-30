#!/bin/sh
ls -a | grep .zcompdump > tmp_clear_script
for j in $(cat tmp_clear_script)
do
	rm $j
done
rm tmp_clear_script
