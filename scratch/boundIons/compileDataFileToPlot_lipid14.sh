# Script to compile the Bound Cation Charge vs Order Parameter data for plotting with gnuplot
#
# Expects ONE input, namely the name of the atom until which the charge distribution is to be integrated.
#
# Usage: ./compileDataFileToPlot_lipid14.sh M_G3P2_M

untilHere=$1
./getDataRows_pureSystem.sh \
    lipidwiseOPsVStime/POPC/Lipid14/noIons \
    > nosalt.out

mean_SEoM_CAHA1=`grep CA-HA1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CAHA2=`grep CA-HA2 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB1=`grep CB-HB1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB2=`grep CB-HB2 nosalt.out | awk '{print $2,$3}'`

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPClipid14.txt \
    ../../../../fromZenodo/POPC/NaCl/Lipid14/150mM/run_200ns_gpu.tpr \
    ./centered_trajs/Lipid14/centered_150mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Lipid14/NaDensity_Lipid14_POPC_150mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/Lipid14/NaCl-150mM \
    1 \
    > salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPClipid14.txt \
    ../../../../fromZenodo/POPC/NaCl/Lipid14/1000mM/run_200ns_gpu.tpr \
    ./centered_trajs/Lipid14/centered_1000mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Lipid14/NaDensity_Lipid14_POPC_1000mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/Lipid14/NaCl-1000mM \
    1 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPClipid14.txt \
    ../../../../fromZenodo/POPC/CaCl2/Lipid14/350mM/035M_CaCl2_POPC_AMB.tpr \
    ./centered_trajs/Lipid14/centered_350mM-CaCl2.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Lipid14/CaDensity_Lipid14_POPC_350mM-CaCl2.xvg \
    lipidwiseOPsVStime/POPC/Lipid14/CaCl2-350mM \
    2 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPClipid14.txt \
    ../../../../fromZenodo/POPC/CaCl2/Lipid14/1000mM/1M_CaCl2_POPC_AMB.tpr \
    ./centered_trajs/Lipid14/centered_1000mM-CaCl2.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Lipid14/CaDensity_Lipid14_POPC_1000mM-CaCl2.xvg \
    lipidwiseOPsVStime/POPC/Lipid14/CaCl2-1000mM \
    2 \
    >> salt.out

echo "# --BOUND- --------- ORDER PARAMETERS ----------- ------ SYSTEM ----------------"
echo "#  CHARGE  noIonsOP      SEoM        OP      SEoM"
grep CB-HB1 nosalt.out
grep CB-HB1 salt.out | sed "s/X_REF_X/${mean_SEoM_CBHB1}/" | sort -n
echo
grep CB-HB2 nosalt.out
grep CB-HB2 salt.out | sed "s/X_REF_X/${mean_SEoM_CBHB2}/" | sort -n
echo
grep CA-HA1 nosalt.out
grep CA-HA1 salt.out | sed "s/X_REF_X/${mean_SEoM_CAHA1}/" | sort -n
echo
grep CA-HA2 nosalt.out
grep CA-HA2 salt.out | sed "s/X_REF_X/${mean_SEoM_CAHA2}/" | sort -n
echo

rm nosalt.out salt.out
