
#!/bin/bash
#timex=$1
#jam=`echo "$1" | awk 'BEGIN {FS=":"}{print $1}'`
tm=$1
jamnow=${tm:0:2}
uppercase=ABCDEFGHIJKLMNOPQRSTUVWXYZ
lowercase=abcdefghijklmnopqrstuvwxyz
uppercase=$uppercase$uppercase
lowercase=$lowercase$lowercase
cat "$1" | tr "${lowercase:${jamnow}:26}" "${lowercase:0:26}" | tr "${uppercase:${jamnow}:26}" "${uppercase:0:26}" > "dekrip.txt"

#cat "$1" | tr "[${lowercase$[jam]}-za-${lowercase$[jam]}]" 	'[a-z]' | "[${uppercase$[jam]}-ZA-${uppercase$[jam]}]"  '[A-Z]'> dekrip.txt 
