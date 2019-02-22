#!/bin/bash
num=1
looping=1

while [ $looping -ne 0 ]
do
if [[ -f /home/vinsensius009/prak1/password$num.txt ]] ;
then
	num=$((num + 1))
else

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold  -w 12 | head -1> /home/vinsensius009/prak1/password$num.txt
looping=0

fi
done
