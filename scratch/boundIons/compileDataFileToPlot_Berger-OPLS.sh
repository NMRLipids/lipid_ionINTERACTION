# Script to compile the Bound Cation Charge vs Order Parameter data for plotting with gnuplot
#
# Expects ONE input, namely the name of the atom until which the charge distribution is to be integrated.
#
# Usage: ./compileDataFileToPlot_Berger-OPLS.sh M_G3P2_M

untilHere=$1
./getDataRows_pureSystem.sh \
    ./lipidwiseOPsVStime/DPPC/Berger-OPLS/noIons \
    > nosalt.out

mean_SEoM_CAHA1=`grep CA-HA1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CAHA2=`grep CA-HA2 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB1=`grep CB-HB1 nosalt.out | awk '{print $2,$3}'`
mean_SEoM_CBHB2=`grep CB-HB2 nosalt.out | awk '{print $2,$3}'`

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingDPPCberger-OPLS.txt \
    ../../../../fromZenodo/DPPC/NaCl/Berger-OPLS/150mM/md.tpr \
    ./centered_trajs/Berger-OPLS/DPPC/centered_150mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Berger-OPLS/NaDensity_Berger-OPLS_DPPC_150mM-NaCl.xvg \
    lipidwiseOPsVStime/DPPC/Berger-OPLS/NaCl-150mM \
    1 \
    > salt.out

./getDataRows_saltSystem.sh \
    ../../MAPPING/mappingDPPCberger-OPLS.txt \
    ../../../../fromZenodo/DPPC/NaCl/Berger-OPLS/1000mM/md.tpr \
    ./centered_trajs/Berger-OPLS/DPPC/centered_1000mM-NaCl.xtc \
    150 \
    $untilHere \
    ./densityProfiles/data/Berger-OPLS/NaDensity_Berger-OPLS_DPPC_1000mM-NaCl.xvg \
    lipidwiseOPsVStime/DPPC/Berger-OPLS/NaCl-1000mM \
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
