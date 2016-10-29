# Script to combine several subscripts to measure the Surface Charge Density
# of a lipid bilayer at the maxima of the g3 carbon density peak (that is,
# separately for each leaflet).
#
# Note, expects FOUR inputs!
#
# Usage example: ./doOneSystem mappingPOPCcharmm.txt popcRUN2.tpr popcRUN2.xtc 150 surfChargeDensProfile_C36_POPC_950mM-NaCl.dat
#
# Markus Miettinen 14Feb2016

mappingFile=$1   # File containing the names of atoms in this FF.
tprFile=$2       # The input tpr-file.
xtcFile=$3       # The input xtc-file.
nSlices=$4       # Number of bins to use in histograms.
outSCDprofile=$5 # File for outputting Surface Charge Density Profile

echo "-- STEP 1/4 --"
./centerTheBilayer.sh $mappingFile $tprFile $xtcFile centered.xtc

echo "-- STEP 2/4 --"
./calculateChargeDistribution.sh $mappingFile $tprFile centered.xtc chargeDistribution.xvg $nSlices 

echo "-- STEP 3/4 --"
./calculateG3position.sh $mappingFile $tprFile centered.xtc g3distribution.xvg $nSlices > foo.bar
cat foo.bar
posPeakAt=`grep ^Positive foo.bar | awk '{print $4}'`
negPeakAt=`grep ^Negative foo.bar | awk '{print $4}'`
rm foo.bar

echo "-- STEP 4/4 --"
./calculateSurfaceChargeDensity.sh $posPeakAt $negPeakAt chargeDistribution.xvg surfaceChargeDensityProfile.dat

#rm centered.xtc chargeDistribution.xvg
mv surfaceChargeDensityProfile.dat $5
