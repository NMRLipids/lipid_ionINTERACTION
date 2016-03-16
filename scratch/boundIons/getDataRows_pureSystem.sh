OPvsTimeFolder=$1
for OPvsTimeFile in $( ls $OPvsTimeFolder/C*dat ); do
    ./getAverageOPsOfBothLeaflets.sh \
	$OPvsTimeFile \
	| grep both \
	| awk '{printf("%8.7f %8.7f %8.7f %8.7f %8.7f %s %s %s %s %s\n", 0, $1,$2,$1,-$2,$3,$4,$5,$6,$7)}'
done
