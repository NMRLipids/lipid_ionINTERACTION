echo
# Check the inputs:
if [ $8 ]
then
    mappingFile=$1          # File containing the names of atoms in this FF.
    tprFile=$2              # The input tpr-file.
    xtcFile=$3              # The input xtc-file.
    slices=$4               # number of bins to use in the density histogram.
    atomName=$5             # Name of the atom in our mapping.
    densityFile=$6          # Ion density distribution file.
    OPvsTimeFolder=$7       # Folder containing the CA-HA1.dat, CA-HA2.dat, CB-HB1, and CB-HB2.dat -files    
    ionCharge=$8            # ion charge
    echo "Mapping:                                       ${mappingFile}"
    echo "TPR file (input):                              ${tprFile}"
    echo "XTC file (input, BILAYER should be CENTERED):  ${xtcFile}"
    echo "Bins in histograms:                            ${slices}"
    echo "Integrate the cation charge until the peak of: ${atomName}"
    echo "Ion density distribution file (input):         ${densityFile}"
    echo "Folder containing CA/B-H1/2.dat files (input): ${OPvsTimeFolder}"
    echo "Ion charge:                                    ${ionCharge}"
else
  echo "Too few inputs, exiting."
  exit
fi
echo


# find the point until where to integrate the cation charge
./calculatePeakPositions.sh \
    $mappingFile $tprFile $xtcFile $slices $atomName \
    > calculatePeakPositions.out
neg=`grep '^Negative' calculatePeakPositions.out | awk '{print $4}'`
pos=`grep '^Positive' calculatePeakPositions.out | awk '{print $4}'`
rm calculatePeakPositions.out

# calculate the amount of bound cation charge
./calculateSurfaceDensity.sh \
    $neg $pos $densityFile $ionCharge \
    > calculateSurfaceDensity.out
lowerCharge=`grep '^Lower' calculateSurfaceDensity.out | awk '{printf("%8.7f", $2)}'`
upperCharge=`grep '^Upper' calculateSurfaceDensity.out | awk '{printf("%8.7f", $2)}'`
rm calculateSurfaceDensity.out

# calculate the OPs:
for OPvsTimeFile in $( ls $OPvsTimeFolder/C*dat ); do
    ./getAverageOPsOfBothLeaflets.sh \
	$OPvsTimeFile \
	> getAverageOPsOfBothLeaflets.out
    
    lowerOP=`grep lower getAverageOPsOfBothLeaflets.out`
    upperOP=`grep upper getAverageOPsOfBothLeaflets.out`

    #output bound cation charge and the corresponding OP
    echo $lowerCharge X_REF_X $lowerOP
    echo $upperCharge X_REF_X $upperOP
done
rm getAverageOPsOfBothLeaflets.out
