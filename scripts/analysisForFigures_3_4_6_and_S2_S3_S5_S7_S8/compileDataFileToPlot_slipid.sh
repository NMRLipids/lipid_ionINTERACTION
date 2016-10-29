# Script to compile the Bound Cation Charge vs Order Parameter data for plotting with gnuplot
#
# Expects ONE input, namely the name of the atom until which the charge distribution is to be integrated.
#
# Usage: ./compileDataFileToPlot_slipid.sh M_G3P2_M


###--- DPPC ---###

untilHere=$1
./getDataRows_pureSystem.sh \
    lipidwiseOPsVStime/DPPC/slipid/noIons \
    > nosalt.out

mean_SEoM_CAHA1=`grep CA-HA1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CAHA2=`grep CA-HA2 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB1=`grep CB-HB1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB2=`grep CB-HB2 nosalt.out | awk '{print $2,$3}'`

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingDPPCslipid.txt \
    ../../../../fromZenodo/DPPC/NaCl/Slipid/850mM/topol.tpr \
    ./centered_trajs/Slipid/DPPC/centered_850mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Slipid/NaDensity_Slipid_DPPC_850mM-NaCl.xvg \
    ./lipidwiseOPsVStime/DPPC/Slipid/NaCl-850mM \
    1 \
    > salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingDPPCslipid.txt \
    ../../../../fromZenodo/DPPC/NaCl/Slipid/1750mM/topol.tpr \
    ./centered_trajs/Slipid/DPPC/centered_1750mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Slipid/NaDensity_Slipid_DPPC_1750mM-NaCl.xvg \
    ./lipidwiseOPsVStime/DPPC/Slipid/NaCl-1750mM \
    1 \
    >> salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingDPPCslipid.txt \
    ../../../../fromZenodo/DPPC/NaCl/Slipid/2570mM/topol.tpr \
    ./centered_trajs/Slipid/DPPC/centered_2570mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Slipid/NaDensity_Slipid_DPPC_2570mM-NaCl.xvg \
    ./lipidwiseOPsVStime/DPPC/Slipid/NaCl-2570mM \
    1 \
    >> salt.out


###--- POPC ---###

untilHere=$1
./getDataRows_pureSystem.sh \
    lipidwiseOPsVStime/POPC/slipid/noIons \
    > nosalt_POPC.out

mean_SEoM_CAHA1_POPC=`grep CA-HA1 nosalt_POPC.out | awk '{print $2,$3}'`
mean_SEoM_CAHA2_POPC=`grep CA-HA2 nosalt_POPC.out | awk '{print $2,$3}'`
mean_SEoM_CBHB1_POPC=`grep CB-HB1 nosalt_POPC.out | awk '{print $2,$3}'`
mean_SEoM_CBHB2_POPC=`grep CB-HB2 nosalt_POPC.out | awk '{print $2,$3}'`

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCslipid.txt \
    ../../../../fromZenodo/POPC/NaCl/Slipid/130mM/md.tpr \
    ./centered_trajs/Slipid/POPC/centered_130mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Slipid/NaDensity_Slipid_POPC_130mM-NaCl.xvg \
    ./lipidwiseOPsVStime/POPC/Slipid/NaCl-130mM \
    1 \
    > salt_POPC.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCslipid.txt \
    ../../../../fromZenodo/POPC/CaCl2/Slipids/450mM/md.tpr \
    ./centered_trajs/Slipid/POPC/centered_450mM-CaCl2.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Slipid/CaDensity_Slipid_POPC_450mM-CaCl2.xvg \
    ./lipidwiseOPsVStime/POPC/Slipid/CaCl2-450mM \
    2 \
    >> salt_POPC.out


echo "# --BOUND- --------- ORDER PARAMETERS ----------- ------ SYSTEM ----------------"
echo "#  CHARGE  noIonsOP      SEoM        OP      SEoM"
grep CB-HB1 nosalt.out
grep CB-HB1 nosalt_POPC.out
grep CB-HB1 salt.out | sed "s/X_REF_X/${mean_SEoM_CBHB1}/" > foo.bar
grep CB-HB1 salt_POPC.out | sed "s/X_REF_X/${mean_SEoM_CBHB1_POPC}/" >> foo.bar
sort -n foo.bar
echo
grep CB-HB2 nosalt.out
grep CB-HB2 nosalt_POPC.out
grep CB-HB2 salt.out | sed "s/X_REF_X/${mean_SEoM_CBHB2}/" > foo.bar
grep CB-HB2 salt_POPC.out | sed "s/X_REF_X/${mean_SEoM_CBHB2_POPC}/" >> foo.bar
sort -n foo.bar
echo
grep CA-HA1 nosalt.out
grep CA-HA1 nosalt_POPC.out
grep CA-HA1 salt.out | sed "s/X_REF_X/${mean_SEoM_CAHA1}/" > foo.bar
grep CA-HA1 salt_POPC.out | sed "s/X_REF_X/${mean_SEoM_CAHA1_POPC}/" >> foo.bar
sort -n foo.bar
echo
grep CA-HA2 nosalt.out
grep CA-HA2 nosalt_POPC.out
grep CA-HA2 salt.out | sed "s/X_REF_X/${mean_SEoM_CAHA2}/" > foo.bar
grep CA-HA2 salt_POPC.out | sed "s/X_REF_X/${mean_SEoM_CAHA2_POPC}/" >> foo.bar
sort -n foo.bar
echo

rm nosalt.out salt.out nosalt_POPC.out salt_POPC.out foo.bar
