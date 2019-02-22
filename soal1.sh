#!/bin/bash

j='0'
for i in nature/*.jpg
do
base64 -d $i | xxd -r >> buka/$j.jpg
j=$(($j+1))
done
