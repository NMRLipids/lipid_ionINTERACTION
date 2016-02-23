# Script to calculate the average position of a given atom for each leaflet
#
# Note, expects SIX inputs!
#
# Usage example: ./calculateAtomPosition.sh mappingPOPCcharmm.txt popcRUN2.tpr centered.xtc g3distribution.xvg 150 M_G3_M
#
# Markus Miettinen 21Feb2016

mappingFile=$1          # File containing the names of atoms in this FF.
tprFile=$2              # The input tpr-file.
xtcFile=$3              # The input xtc-file.
outFileForHistogram=$4  # Output where to write the g3 density histogram.
slices=$5               # number of bins to use in the density histogram.
atomName=$6             # Name of the atom in our mapping.

echo
echo "Will calculate the POSITIONS of ${atomName} peaks for each leaflet."
# Warn that the bilayer should be centered (this is because if
# bilayer is originally separated such that the water slab is in
# the center of the box, the script will output the distances
# from the center of the water slab, not the bilayer center):
echo "Note. I assume that your bilayer CoM is at the box center."
echo

# Find the  atoms:
# ... find their name in this FF:
G1g3name=`grep $atomName $mappingFile | awk '{print $2}'`
echo "The name of the $atomName in this force field:" $G1g3name
# ... and put them all to an index file:
echo -e "a ${G1g3name}\nq" | gmx make_ndx -f $tprFile -o foo.ndx >& make_ndx.output
rm make_ndx.output
#
echo "Calculating density distribution of ${G1g3name}s..."
echo -e "${G1g3name}\n${G1g3name}" \
    | gmx density -center -dens number -sl $slices \
	  -f $xtcFile \
	  -s $tprFile \
	  -n foo.ndx \
	  -o $outFileForHistogram >& center.output
grep Selected center.output
grep gcq center.output
rm center.output foo.ndx

echo
echo "Peak positions:"
negPeak=`grep -v ^[\#,@] ${outFileForHistogram} \
    | awk '{if ($1<=0){sum+=$2;integral+=$1*$2}}END{print integral/sum}'`

negPeakS2=`grep -v ^[\#,@] ${outFileForHistogram} \
    | awk '{if ($1<=0){sum+=$2;integral+=$1**2*$2}}END{print integral/sum}'`

negSD=`echo $negPeak $negPeakS2 | awk '{print sqrt($2-$1**2)}'`

posPeak=`grep -v ^[\#,@] ${outFileForHistogram} \
    | awk '{if ($1>=0){sum+=$2;integral+=$1*$2}}END{print integral/sum}'`

posPeakS2=`grep -v ^[\#,@] ${outFileForHistogram} \
    | awk '{if ($1>=0){sum+=$2;integral+=$1**2*$2}}END{print integral/sum}'`

posSD=`echo $posPeak $posPeakS2 | awk '{print sqrt($2-$1**2)}'`

echo "Negative peak at: ${negPeak} (std. dev. ${negSD}) nm from bilayer center."
echo "Positive peak at:  ${posPeak} (std. dev. ${posSD}) nm from bilayer center."
echo

rm g3distribution.xvg
