#!/bin/bash
num=1
looping=1

while [ $looping -ne 0 ]
do
if [[ -f /home/vinsensius009/modul1/SoalShift_modul1_D04-master/password$num.txt ]] ;
then
	num=$((num + 1))
else

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold  -w 12 | head -1 |  awk '$0 ~ /[a-z]/ && $0 ~ /[0-9]/ && $0 ~ /[A-Z]/ {print $0;}' > /home/vinsensius009/modul1/SoalShift_modul1_D04-master/password$num.txt

looping=0

fi
done
