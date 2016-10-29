# Script (for UA models) to calculate C_alpha and C_beta order parameters for each leaflet separately.
#
# Output Files: CB-HB1.dat, CB-HB2.dat, CA-HA1.dat, and CA-HA2.dat have a column for each lipid. Each
# row is a single time frame. "U" stands for upper and "L" for lower leaflet.
# 
# NOTE-1: Expects the trajectory to have bilayer center at box CENTER.
# NOTE-2: Expects the SCRIPT 'getOPsOfThisFrame_withProtonation.sh' to be in the same folder.
#
# Usage example: ./getLeafletwiseOPsFromCenteredTraj_withProtonation.sh mappingPOPCberger.txt centered_berger.xtc berger.tpr M_POPC_M ffgmx2.hdb
#
# Markus Miettinen 8march2016.

echo
# Check the inputs:
if [ $5 ]
then
  mappingFile=$1      # File containing the names of atoms in this FF.
  centeredXTCfile=$2  # The input xtc-file. NOTE: Assume to be CENTERED!
  tprFile=$3          # The input tpr-file.
  lipidName=$4        # The name of lipid type.
  hydrogenFile=$5     # File containing the info for adding the explicit hydrogens.
  echo "Mapping:            ${mappingFile}"
  echo "(Centered) XTC in:  ${centeredXTCfile}"
  echo "TPR in:             ${tprFile}"
  echo "Lipid name:         ${lipidName}"
  echo "Hydrogen database:  ${hydrogenFile}"
else
  echo "Too few inputs, exiting."
  exit
fi
echo

# Find the names of the atoms in this force field:
betaC=`grep M_G3C5_M $mappingFile | awk '{printf("%*s",5,$2)}'`
betaH1=`grep M_G3C5H1_M $mappingFile | awk '{printf("%*s",5,$2)}'`
betaH2=`grep M_G3C5H2_M $mappingFile | awk '{printf("%*s",5,$2)}'`

alfaC=`grep M_G3C4_M $mappingFile | awk '{printf("%*s",5,$2)}'`
alfaH1=`grep M_G3C4H1_M $mappingFile | awk '{printf("%*s",5,$2)}'`
alfaH2=`grep M_G3C4H2_M $mappingFile | awk '{printf("%*s",5,$2)}'`

# Find the name of the lipid in this force field:
lipid=`grep ${lipidName} $mappingFile | awk '{printf("%*s",5,$2)}'`

# Put these names in the template script for framewise OP calculation:
sed "s/X_BETAC_X/${betaC}/" getOPsOfThisFrame_withProtonation.sh \
    | sed "s/X_ALFAC_X/${alfaC}/" \
    | sed "s/X_BETAH1_X/${betaH1}/" \
    | sed "s/X_BETAH2_X/${betaH2}/" \
    | sed "s/X_ALFAH1_X/${alfaH1}/" \
    | sed "s/X_ALFAH2_X/${alfaH2}/" \
    | sed "s/X_LIPID_X/${lipid}/" \
    | sed "s|X_TPRFILE_X|${tprFile}|" \
	  > getOPsOfThisFrame_TEMP.sh

chmod u+x getOPsOfThisFrame_TEMP.sh

# Move hydrogen database file in this folder:
cp ${hydrogenFile} ./ffgmx2.hdb

rm CB-HB1.dat CB-HB2.dat CA-HA1.dat CA-HA2.dat
# Use trjconv to write each frame to a file "fileN.gro", and run "getOPsOfThisFrame_TEMP.sh" on it
gmx trjconv -sep -exec ./getOPsOfThisFrame_TEMP.sh \
	-o file.gro \
	-f $centeredXTCfile \
	-s $tprFile

rm getOPsOfThisFrame_TEMP.sh

