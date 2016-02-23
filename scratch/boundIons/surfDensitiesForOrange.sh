./calculateG3position.sh \
    ../../MAPPING/mappingPOPCorange.txt \
    ../../../../fromZenodo/POPC/NaCl/Orange/140mM/popcRUN2.tpr \
    ./centered_trajs/Orange/centered_140mM-NaCl.xtc \
    g3distribution.xvg 150 \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 140mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Orange/NaDensity_Orange_POPC_140mM-NaCl.xvg test.xvg




./calculateG3position.sh \
    ../../MAPPING/mappingPOPCorange.txt \
    ../../../../fromZenodo/POPC/NaCl/Orange/510mM/popcRUN.tpr \
    ./centered_trajs/Orange/centered_510mM-NaCl.xtc \
    g3distribution.xvg 150 \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 510mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Orange/NaDensity_Orange_POPC_510mM-NaCl.xvg test.xvg





./calculateG3position.sh \
    ../../MAPPING/mappingPOPCorange.txt \
    ../../../../fromZenodo/POPC/NaCl/Orange/1000mM/popcRUN.tpr \
    ./centered_trajs/Orange/centered_1000mM-NaCl.xtc \
    g3distribution.xvg 150 \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 1000mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Orange/NaDensity_Orange_POPC_1000mM-NaCl.xvg test.xvg





./calculateG3position.sh \
    ../../MAPPING/mappingPOPCorange.txt \
    ../../../../fromZenodo/POPC/CaCl2/Orange/510mM/popcRUN2.tpr \
    ./centered_trajs/Orange/centered_510mM-CaCl2.xtc \
    g3distribution.xvg 150 \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 510mM CaCl2:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Orange/CaDensity_Orange_POPC_510mM-CaCl2.xvg test.xvg
