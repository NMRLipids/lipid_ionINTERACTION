atomName=$1

./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCmacrog_alt.txt \
    ../../../../fromZenodo/POPC/NaCl/MacRog/103mM/100.tpr \
    ./centered_trajs/MacRog/centered_103mM-NaCl.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`

echo "# 103mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/MacRog/NaDensity_MacRog_POPC_103mM-NaCl.xvg test.xvg



./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCmacrog_alt.txt \
    ../../../../fromZenodo/POPC/NaCl/MacRog/207mM/200.tpr \
    ./centered_trajs/MacRog/centered_207mM-NaCl.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`

echo "# 207mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/MacRog/NaDensity_MacRog_POPC_207mM-NaCl.xvg test.xvg


./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCmacrog_alt.txt \
    ../../../../fromZenodo/POPC/NaCl/MacRog/311mM/300.tpr \
    ./centered_trajs/MacRog/centered_311mM-NaCl.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`

echo "# 311mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/MacRog/NaDensity_MacRog_POPC_311mM-NaCl.xvg test.xvg



./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCmacrog_alt.txt \
    ../../../../fromZenodo/POPC/NaCl/MacRog/416mM/400.tpr \
    ./centered_trajs/MacRog/centered_416mM-NaCl.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`

echo "# 416mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/MacRog/NaDensity_MacRog_POPC_416mM-NaCl.xvg test.xvg

