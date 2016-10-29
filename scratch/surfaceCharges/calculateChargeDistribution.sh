# Script to calculate total charge distribution across bilayer
#
# Note, expects FIVE inputs!
#
# Usage example: ./calculateChargeDistribution.sh mappingPOPCcharmm.txt popcRUN2.tpr centered.xtc chargeDistribution.xvg 150
#
# Markus Miettinen 14Feb2016

mappingFile=$1          # File containing the names of atoms in this FF.
tprFile=$2              # The input tpr-file.
xtcFile=$3              # The input xtc-file.
outFileForHistogram=$4  # Output where to write the g3 density histogram.
slices=$5               # number of bins to use in the density histogram.

echo
# Find the g3 carbons:
# ... find their name in this FF:
G1g3name=`grep M_G3_M $mappingFile | awk '{print $2}'`
echo 'The name of the g3 carbon:' $G1g3name
# ... and put them all to an index file:
echo -e "a ${G1g3name}\nq" | gmx make_ndx -f $tprFile -o foo.ndx >& make_ndx.output
rm make_ndx.output
#
echo "Calculating charge distribution using all components..."
echo -e "${G1g3name}\nSystem" \
    | gmx density -center -dens charge -sl $slices \
	  -f $xtcFile \
	  -s $tprFile \
	  -n foo.ndx \
	  -o $outFileForHistogram >& center.output
grep Selected center.output
grep gcq center.output
rm center.output foo.ndx
echo
