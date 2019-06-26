#!/bin/sh

if [ $# != 1 ]
then
	echo enter 1 arg
	exit
fi
vim -s 42header_add.keys $1
