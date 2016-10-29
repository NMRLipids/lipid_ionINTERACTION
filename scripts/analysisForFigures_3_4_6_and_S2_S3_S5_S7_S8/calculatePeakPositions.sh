# Script to calculate the average positions of a given atom for each leaflet
#
# Usage example: ./calculatePeakPositions.sh mappingPOPCcharmm.txt popcRUN2.tpr centered.xtc 150 M_G3_M
#
# NOTE that the BILAYER should be CENTERED. (For example, if the
# bilayer is originally separated such that the water slab is in
# the center of the box, the script will output the distances
# from the center of the water slab, not the bilayer center):
#
# Markus Miettinen 8march2016

echo
# Check the inputs:
if [ $5 ]
then
    mappingFile=$1          # File containing the names of atoms in this FF.
    tprFile=$2              # The input tpr-file.
    xtcFile=$3              # The input xtc-file.
    slices=$4               # number of bins to use in the density histogram.
    atomName=$5             # Name of the atom in our mapping.
    outFileForHistogram=outPutFileForHistogram_temp.xvg
    echo "Mapping:            ${mappingFile}"
    echo "TPR in:             ${tprFile}"
    echo "(Centered) XTC in:  ${xtcFile}"
    echo "Bins in histogram:  ${slices}"
    echo "Output the peak of: ${atomName}"
else
  echo "Too few inputs, exiting."
  exit
fi
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
if [ `grep -c gcq center.output` == 1 ]
then
  grep Selected center.output
else
  echo "    gmx density failed, exiting."
  exit
fi
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

rm ${outFileForHistogram}
