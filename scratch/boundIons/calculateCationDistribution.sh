# Script to calculate cation DENSITY distribution across bilayer
#
# Note, expects SIX inputs!
#
# Usage example: ./calculateCationDistribution.sh mappingPOPCcharmm.txt popcRUN2.tpr centered.xtc cationDistribution.xvg 150 NA
#
# Markus Miettinen 16Feb2016

mappingFile=$1          # File containing the names of atoms in this FF.
tprFile=$2              # The input tpr-file.
xtcFile=$3              # The input xtc-file.
outFileForHistogram=$4  # Output where to write the cation density histogram.
slices=$5               # Number of bins to use in the density histogram.
ion=$6                  # Name of the cation under study, IN CAPITALS (NA, CA)

echo
# Find the g3 carbons:
# ... find their name in this FF:
G1g3name=`grep M_G3_M $mappingFile | awk '{print $2}'`
ionName=`grep M_${ion}_M $mappingFile | awk '{print $2}'`
echo 
echo "Will calculate the number density distribution of ${ionName} cations across the bilayer."
echo 'The name of the g3 carbon:' $G1g3name
# ... and put them all to an index file:
echo 'Making index file...'
echo '' > seed.ndx
echo -e "a ${G1g3name}\na ${ionName}\nq" | gmx make_ndx -f $tprFile -n seed.ndx -o foo.ndx >& make_ndx.output
grep gcq make_ndx.output
rm seed.ndx make_ndx.output
grep '\[' foo.ndx
#
echo
echo "Calculating the distribution..."
echo -e "${G1g3name}\n${ionName}\n" \
    | gmx density -center -dens number -sl $slices \
	  -f $xtcFile \
	  -s $tprFile \
	  -n foo.ndx \
	  -o $outFileForHistogram >& density.output
grep gcq density.output
grep Selected density.output
rm density.output foo.ndx
echo
