# Script to calculate choline order parameters for each leaflet separately
# NOTE. Expects the trajectory to have bilayer center at box center.
#
# Expects THREE inputs.
#
# Usage example: 
#
# Markus Miettinen 19Feb2016.

mappingFile=$1
centeredXTCfile=$2
tprFile=$3

# Find the names of the atoms in this force field:
betaC=`grep M_G3C5_M $mappingFile | awk '{printf("%*s",5,$2)}'`
betaH1=`grep M_G3C5H1_M $mappingFile | awk '{printf("%*s",5,$2)}'`
betaH2=`grep M_G3C5H2_M $mappingFile | awk '{printf("%*s",5,$2)}'`

alfaC=`grep M_G3C4_M $mappingFile | awk '{printf("%*s",5,$2)}'`
alfaH1=`grep M_G3C4H1_M $mappingFile | awk '{printf("%*s",5,$2)}'`
alfaH2=`grep M_G3C4H2_M $mappingFile | awk '{printf("%*s",5,$2)}'`

# Put the names of the atoms into the OP-calculation script template:
sed "s/X_BETAC_X/${betaC}/" getOPsOfThisFrame.sh \
    | sed "s/X_ALFAC_X/${alfaC}/" \
    | sed "s/X_BETAH1_X/${betaH1}/" \
    | sed "s/X_BETAH2_X/${betaH2}/" \
    | sed "s/X_ALFAH1_X/${alfaH1}/" \
    | sed "s/X_ALFAH2_X/${alfaH2}/" \
	  > getOPsOfThisFrame_TEMP.sh

chmod u+x getOPsOfThisFrame_TEMP.sh

rm CB-HB1.dat CB-HB2.dat CA-HA1.dat CA-HA2.dat
# Use trjconv to write each frame to a file "fileN.gro", and run "getOPsOfThisFrame_TEMP.sh" on it
gmx trjconv -sep -exec ./getOPsOfThisFrame_TEMP.sh -o file.gro \
    -f $centeredXTCfile \
    -s $tprFile

rm getOPsOfThisFrame_TEMP.sh
