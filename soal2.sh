
#!/bin/bash

#a
awk -F ',' '{if($7 == '2012') i[$1]+=$10} END {for(x in i){print i[x]" " x}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1
#b
awk -F ',' '{if($1 == "United States" && $7 == '2012') i[$4]+=$10} END {for(x in i) {print i[x]" "x}}' WA_Sales_Products_2012-14.csv | sort -nr | head -3
#c
awk -F ',' '{if($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Mountaineering Equipment" && $7 == '2012') i[$6]+=$10} END {for(x in i) {print i[x]" "x}}' WA_Sales_Products_2012-14.csv | sort -nr | head -3


