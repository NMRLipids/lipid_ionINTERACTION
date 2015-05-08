cat NACLcons.dat | awk '{if(NR==1){a=$2;b=$3;c=$4;d=$5;e=$6;f=$7;g=$8;h=$9;}print $1" " $2-a" "$3-b" "$4-c" "$5-d" "$6-e" "$7-f" "$8-g" "$9-h}' > NACLconschange.dat
cat NACLconsSCALED.dat | awk '{if(NR==1){a=$2;b=$3;c=$4;d=$5;e=$6;f=$7;g=$8;h=$9;}print $1" " $2-a" "$3-b" "$4-c" "$5-d" "$6-e" "$7-f" "$8-g" "$9-h}' > NACLconsSCALEDchange.dat






