mappingFILE=/work/ollilas1/HGmodel/NMRlipids/NmrLipidsCholXray/MAPPING/mappingPOPCulmschneider.txt
tprname=/work/ollilas1/POPCdata/POPCulmschneider/402.tpr
trajname=/work/ollilas1/POPCdata/POPCulmschneider/md_dc.xtc
outname=G3-G2-G1-OdihMATTI.xvg

Aname=$(grep M_G1O1_M $mappingFILE | awk '{print $2}')
Bname=$(grep M_G1_M $mappingFILE | awk '{print $2}')
Cname=$(grep M_G2_M $mappingFILE | awk '{print $2}')
Dname=$(grep M_G3_M $mappingFILE | awk '{print $2}')
#
echo 'keep 0
a' "$Aname" "$Bname" "$Cname" "$Dname" '
del 0
q
' | make_ndx -f $tprname -o tmpINDEX.ndx
g_angle -f $trajname -n tmpINDEX.ndx -type dihedral -od $outname


