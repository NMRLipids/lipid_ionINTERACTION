atomName=$1

./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPClipid14.txt \
    ../../../../fromZenodo/POPC/NaCl/Lipid14/150mM/run_200ns_gpu.tpr \
    ./centered_trajs/Lipid14/centered_150mM-NaCl.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 150mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Lipid14/NaDensity_Lipid14_POPC_150mM-NaCl.xvg test.xvg








./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPClipid14.txt \
    ../../../../fromZenodo/POPC/NaCl/Lipid14/1000mM/run_200ns_gpu.tpr \
    ./centered_trajs/Lipid14/centered_1000mM-NaCl.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`

echo "1000mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Lipid14/NaDensity_Lipid14_POPC_1000mM-NaCl.xvg test.xvg




./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPClipid14.txt \
    ../../../../fromZenodo/POPC/CaCl2/Lipid14/350mM/035M_CaCl2_POPC_AMB.tpr \
    ./centered_trajs/Lipid14/centered_350mM-CaCl2.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`

echo "350mM CaCl2:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Lipid14/CaDensity_Lipid14_POPC_350mM-CaCl2.xvg test.xvg






./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPClipid14.txt \
    ../../../../fromZenodo/POPC/CaCl2/Lipid14/1000mM/1M_CaCl2_POPC_AMB.tpr \
    ./centered_trajs/Lipid14/centered_1000mM-CaCl2.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "1000mM CaCl2:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/Lipid14/CaDensity_Lipid14_POPC_1000mM-CaCl2.xvg test.xvg


