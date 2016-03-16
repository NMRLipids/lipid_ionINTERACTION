# Script to compile the Bound Cation Charge vs Order Parameter data for plotting with gnuplot
#
# Expects ONE input, namely the name of the atom until which the charge distribution is to be integrated.
#
# Usage: ./compileDataFileToPlot_Orange.sh M_G3P2_M

untilHere=$1
./getDataRows_pureSystem.sh \
    ./lipidwiseOPsVStime/POPC/Orange/noIons \
    > nosalt.out

mean_SEoM_CAHA1=`grep CA-HA1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CAHA2=`grep CA-HA2 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB1=`grep CB-HB1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB2=`grep CB-HB2 nosalt.out | awk '{print $2,$3}'`

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCorange.txt \
    ../../../../fromZenodo/POPC/NaCl/Orange/140mM/popcRUN2.tpr \
    ./centered_trajs/Orange/centered_140mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Orange/NaDensity_Orange_POPC_140mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/Orange/NaCl-140mM \
    1 \
    > salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCorange.txt \
    ../../../../fromZenodo/POPC/NaCl/Orange/510mM/popcRUN.tpr \
    ./centered_trajs/Orange/centered_510mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Orange/NaDensity_Orange_POPC_510mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/Orange/NaCl-510mM \
    1 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCorange.txt \
    ../../../../fromZenodo/POPC/NaCl/Orange/1000mM/popcRUN.tpr \
    ./centered_trajs/Orange/centered_1000mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Orange/NaDensity_Orange_POPC_1000mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/Orange/NaCl-1000mM \
    1 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCorange.txt \
    ../../../../fromZenodo/POPC/CaCl2/Orange/510mM/popcRUN2.tpr \
    ./centered_trajs/Orange/centered_510mM-CaCl2.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Orange/CaDensity_Orange_POPC_510mM-CaCl2.xvg \
    lipidwiseOPsVStime/POPC/Orange/CaCl2-510mM \
    1 \
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
