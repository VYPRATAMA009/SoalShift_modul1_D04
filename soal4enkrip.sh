#!/bin/bash
jam=`date +"%H"`
input="/var/log/syslog"
#uppercase=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
#lowercase=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
lowercase="abcdefghijklmnopqrstuvwxyz"
uppercase=$uppercase$uppercase
lowercase=$lowercase$lowercase
jamnow=`date +"%H:%M %d-%m-%Y"`

#cat $input
cat $input | tr "${lowercase:0:26}" "${lowercase:$jam:26}"  | tr "${uppercase:0:26}" "${uppercase:$jam:26}" > "$jamnow"

