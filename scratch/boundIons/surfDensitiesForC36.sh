atomName=$1

./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/NaCl/C36/350mM/popcRUN2.tpr \
    ./centered_trajs/C36/POPC/centered_350mM-NaCl.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 350mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/C36/NaDensity_C36_POPC_350mM-NaCl.xvg test.xvg



./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/NaCl/C36/690mM/popcRUN2.tpr \
    ./centered_trajs/C36/POPC/centered_690mM-NaCl.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 690mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/C36/NaDensity_C36_POPC_690mM-NaCl.xvg test.xvg




./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/NaCl/C36/950mM/popcRUN2.tpr \
    ./centered_trajs/C36/POPC/centered_950mM-NaCl.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 950mM NaCl:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/C36/NaDensity_C36_POPC_950mM-NaCl.xvg test.xvg




./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/CaCl2/C36/350mM/035M_CaCl2_POPC_CRM36.tpr \
    ./centered_trajs/C36/POPC/centered_350mM-CaCl2.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 350mM CaCl2:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/C36/CaDensity_C36_POPC_350mM-CaCl2.xvg test.xvg




./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/CaCl2/C36/670mM/067M_CaCl2_POPC_CRM36.tpr \
    ./centered_trajs/C36/POPC/centered_670mM-CaCl2.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 670mM CaCl2:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/C36/CaDensity_C36_POPC_670mM-CaCl2.xvg test.xvg




./calculateAtomPosition.sh \
    ../../MAPPING/mappingPOPCcharmm.txt \
    ../../../../fromZenodo/POPC/CaCl2/C36/1000mM/1M_CaCl2_POPC_CRM36.tpr \
    ./centered_trajs/C36/POPC/centered_1000mM-CaCl2.xtc \
    g3distribution.xvg 150 $atomName \
    > calculateG3position.out

neg=`grep '^Negative' calculateG3position.out | awk '{print $4}'`
pos=`grep '^Positive' calculateG3position.out | awk '{print $4}'`


echo "# 1000mM CaCl2:"
./calculateSurfaceDensity.sh $neg $pos ./densityProfiles/data/C36/CaDensity_C36_POPC_1000mM-CaCl2.xvg test.xvg
