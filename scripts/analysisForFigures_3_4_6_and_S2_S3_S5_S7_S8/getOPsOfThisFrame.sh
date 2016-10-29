fileName=file$1.gro
boxCentZ=`tail -n1 ${fileName} | awk '{print $3/2}'`

awk -v boxCenter=$boxCentZ -v Cname="X_BETAC_X" -v Hname="X_BETAH1_X" -f gro_OP_separate_leaflets.awk ${fileName} >> CB-HB1.dat
awk -v boxCenter=$boxCentZ -v Cname="X_BETAC_X" -v Hname="X_BETAH2_X" -f gro_OP_separate_leaflets.awk ${fileName} >> CB-HB2.dat
awk -v boxCenter=$boxCentZ -v Cname="X_ALFAC_X" -v Hname="X_ALFAH1_X" -f gro_OP_separate_leaflets.awk ${fileName} >> CA-HA1.dat
awk -v boxCenter=$boxCentZ -v Cname="X_ALFAC_X" -v Hname="X_ALFAH2_X" -f gro_OP_separate_leaflets.awk ${fileName} >> CA-HA2.dat

rm $fileName

