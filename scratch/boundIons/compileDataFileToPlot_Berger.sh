# Script to compile the Bound Cation Charge vs Order Parameter data for plotting with gnuplot
#
# Expects ONE input, namely the name of the atom until which the charge distribution is to be integrated.
#
# Usage: ./compileDataFileToPlot_Berger.sh M_G3P2_M

###--- DPPC ---###

untilHere=$1
./getDataRows_pureSystem.sh \
    lipidwiseOPsVStime/DPPC/Berger/noIons \
    > nosalt.out

mean_SEoM_CAHA1=`grep CA-HA1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CAHA2=`grep CA-HA2 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB1=`grep CB-HB1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB2=`grep CB-HB2 nosalt.out | awk '{print $2,$3}'`

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingDPPCberger.txt \
    ../../../../fromZenodo/DPPC/NaCl/Berger/150mM/md.tpr \
    centered_trajs/Berger/DPPC/centered_150mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Berger/NaDensity_Berger_DPPC_150mM-NaCl.xvg \
    lipidwiseOPsVStime/DPPC/Berger/NaCl-150mM \
    1 \
    > salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingDPPCberger.txt \
    ../../../../fromZenodo/DPPC/NaCl/Berger/1000mM/md.tpr \
    centered_trajs/Berger/DPPC/centered_1000mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Berger/NaDensity_Berger_DPPC_1000mM-NaCl.xvg \
    lipidwiseOPsVStime/DPPC/Berger/NaCl-1000mM \
    1 \
    >> salt.out


###--- POPC ---###

./getDataRows_pureSystem.sh \
    lipidwiseOPsVStime/POPC/Berger/noIons \
    > nosalt_POPC.out

mean_SEoM_CAHA1_POPC=`grep CA-HA1 nosalt_POPC.out | awk '{print $2,$3}'`
mean_SEoM_CAHA2_POPC=`grep CA-HA2 nosalt_POPC.out | awk '{print $2,$3}'`
mean_SEoM_CBHB1_POPC=`grep CB-HB1 nosalt_POPC.out | awk '{print $2,$3}'`
mean_SEoM_CBHB2_POPC=`grep CB-HB2 nosalt_POPC.out | awk '{print $2,$3}'`

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCberger.txt \
    ../../../../fromZenodo/POPC/NaCl/Berger/340mM/run2.tpr \
    centered_trajs/Berger/POPC/centered_340mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Berger/NaDensity_Berger_POPC_340mM-NaCl.xvg \
    lipidwiseOPsVStime/POPC/Berger/NaCl-340mM \
    1 \
    > salt_POPC.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingPOPCberger.txt \
    ../../../../fromZenodo/POPC/CaCl2/Berger/340mM/run407.tpr \
    ./centered_trajs/Berger/POPC/centered_340mM-CaCl2.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Berger/CaDensity_Berger_POPC_340mM-CaCl2.xvg \
    lipidwiseOPsVStime/POPC/Berger/CaCl2-340mM \
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

rm nosalt.out nosalt_POPC.out salt.out salt_POPC.out foo.bar
