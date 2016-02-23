./calculateG3position.sh \
    ../../MAPPING/mappingPOPCberger.txt \
    ../../../../fromZenodo/POPC/NaCl/Berger/340mM/run407.tpr \
    ./centered_trajs/Berger/POPC/centered_340mM-NaCl.xtc \
    g3distribution.xvg 150 \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 340mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Berger/NaDensity_Berger_POPC_340mM-NaCl.xvg test.xvg


./calculateG3position.sh \
    ../../MAPPING/mappingPOPCberger.txt \
    ../../../../fromZenodo/POPC/CaCl2/Berger/340mM/run407.tpr \
    ./centered_trajs/Berger/POPC/centered_340mM-CaCl2.xtc \
    g3distribution.xvg 150 \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 340mM CaCl2:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Berger/CaDensity_Berger_POPC_340mM-CaCl2.xvg test.xvg
