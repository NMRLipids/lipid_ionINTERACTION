# Script to compile the Bound Cation Charge vs Order Parameter data for plotting with gnuplot
#
# Expects ONE input, namely the name of the atom until which the charge distribution is to be integrated.
#
# Usage: ./compileDataFileToPlot_macrog.sh M_G3P2_M

untilHere=$1
./getDataRows_pureSystem.sh \
    lipidwiseOPsVStime/POPC/MacRog/noIons \
    > nosalt.out

mean_SEoM_CAHA1=`grep CA-HA1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CAHA2=`grep CA-HA2 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB1=`grep CB-HB1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB2=`grep CB-HB2 nosalt.out | awk '{print $2,$3}'`

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCmacrog_alt.txt \
    ../../../../fromZenodo/POPC/NaCl/MacRog/103mM/100.tpr \
    ./centered_trajs/MacRog/centered_103mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/MacRog/NaDensity_MacRog_POPC_103mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/MacRog/NaCl-103mM \
    1 \
    > salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCmacrog_alt.txt \
    ../../../../fromZenodo/POPC/NaCl/MacRog/207mM/200.tpr \
    ./centered_trajs/MacRog/centered_207mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/MacRog/NaDensity_MacRog_POPC_207mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/MacRog/NaCl-207mM \
    1 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCmacrog_alt.txt \
    ../../../../fromZenodo/POPC/NaCl/MacRog/311mM/300.tpr \
    ./centered_trajs/MacRog/centered_311mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/MacRog/NaDensity_MacRog_POPC_311mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/MacRog/NaCl-311mM \
    1 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCmacrog_alt.txt \
    ../../../../fromZenodo/POPC/NaCl/MacRog/416mM/400.tpr \
    ./centered_trajs/MacRog/centered_416mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/MacRog/NaDensity_MacRog_POPC_416mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/MacRog/NaCl-416mM \
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
