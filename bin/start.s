#!/bin/bash

`which $1`
STATUS=$?
if test $STATUS -eq 0 
  then
	echo -e "\n\tA script named \"$1\" already exists.\n\tPlease try another name.\n"
	exit 
else
	SHELLVAR=`which $2`
	touch $1
	chmod 700 $1
	echo "#!$SHELLVAR" > $1
	mv $1 $HOME/bin/$1 2> /dev/null
	`echo $EDITOR`  $HOME/bin/$1
fi

