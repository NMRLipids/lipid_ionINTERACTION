# Script to compile the Bound Cation Charge vs Order Parameter data for plotting with gnuplot
#
# Expects ONE input, namely the name of the atom until which the charge distribution is to be integrated.
#
# Usage: ./compileDataFileToPlot_C36.sh M_G3P2_M

untilHere=$1
./getDataRows_pureSystem.sh \
    lipidwiseOPsVStime/POPC/C36/C36_noIons-Hubert \
    > nosalt.out

mean_SEoM_CAHA1=`grep CA-HA1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CAHA2=`grep CA-HA2 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB1=`grep CB-HB1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB2=`grep CB-HB2 nosalt.out | awk '{print $2,$3}'`

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/NaCl/C36/350mM/popcRUN2.tpr \
    ./centered_trajs/C36/POPC/centered_350mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/C36/NaDensity_C36_POPC_350mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/C36/C36_NaCl-350mM \
    1 \
    > salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/NaCl/C36/690mM/popcRUN2.tpr \
    ./centered_trajs/C36/POPC/centered_690mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/C36/NaDensity_C36_POPC_690mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/C36/C36_NaCl-690mM \
    1 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/NaCl/C36/950mM/popcRUN2.tpr \
    ./centered_trajs/C36/POPC/centered_950mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/C36/NaDensity_C36_POPC_950mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/C36/C36_NaCl-950mM \
    1 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/CaCl2/C36/350mM/035M_CaCl2_POPC_CRM36.tpr \
    ./centered_trajs/C36/POPC/centered_350mM-CaCl2.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/C36/CaDensity_C36_POPC_350mM-CaCl2.xvg \
    lipidwiseOPsVStime/POPC/C36/C36_CaCl2-350mM \
    2 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/CaCl2/C36/450mM/md.tpr \
    ./centered_trajs/C36/POPC/centered_450mM-CaCl2.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/C36/CaDensity_C36_POPC_450mM-CaCl2.xvg \
    lipidwiseOPsVStime/POPC/C36/C36_CaCl2-450mM \
    2 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/CaCl2/C36/670mM/067M_CaCl2_POPC_CRM36.tpr \
    ./centered_trajs/C36/POPC/centered_670mM-CaCl2.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/C36/CaDensity_C36_POPC_670mM-CaCl2.xvg \
    lipidwiseOPsVStime/POPC/C36/C36_CaCl2-670mM \
    2 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/CaCl2/C36/1000mM/1M_CaCl2_POPC_CRM36.tpr \
    ./centered_trajs/C36/POPC/centered_1000mM-CaCl2.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/C36/CaDensity_C36_POPC_1000mM-CaCl2.xvg \
    lipidwiseOPsVStime/POPC/C36/C36_CaCl2-1000mM \
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
