
#!/bin/bash
jam=$(date +"%H")
input="/var/log/syslog"
uppercase=ABCDEFGHIJKLMNOPQRSTUVWXYZ
lowercase=abcdefghijklmnopqrstuvwxyz

jamnow=$(date +"%H:%M %d-%m-%Y")

cat $input | tr ${lowercase:0:26} ${lowercase:${jam}:26} > "$jamnow"

cat $input | tr ${uppercase:0:26} ${uppercase:${jam}:26} > "jamnow"
