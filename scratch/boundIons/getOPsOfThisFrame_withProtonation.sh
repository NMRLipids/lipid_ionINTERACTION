# NOTE! Must use Gromacs 4.0.2, because that is the last version where
# protonate (a.k.a g_protonate) actually works. To this end, need to
# also have a tpr-file grompped with the version 4.0.2 (if the version
# used for grommping is later, the tpr will not be accepted by protonate).

fileName=file$1.gro
fileProt=file$1_protonated.gro

boxCentZ=`tail -n1 ${fileName} | awk '{print $3/2}'`

echo X_LIPID_X | /usr/local/gromacs-4.0.2/bin/protonate -f ${fileName} -s X_TPRFILE_X -o ${fileProt} >& protonate.out

awk -v boxCenter=$boxCentZ -v Cname="X_BETAC_X" -v Hname="X_BETAH1_X" -f gro_OP_separate_leaflets.awk ${fileProt} >> CB-HB1.dat
awk -v boxCenter=$boxCentZ -v Cname="X_BETAC_X" -v Hname="X_BETAH2_X" -f gro_OP_separate_leaflets.awk ${fileProt} >> CB-HB2.dat
awk -v boxCenter=$boxCentZ -v Cname="X_ALFAC_X" -v Hname="X_ALFAH1_X" -f gro_OP_separate_leaflets.awk ${fileProt} >> CA-HA1.dat
awk -v boxCenter=$boxCentZ -v Cname="X_ALFAC_X" -v Hname="X_ALFAH2_X" -f gro_OP_separate_leaflets.awk ${fileProt} >> CA-HA2.dat

rm $fileName $fileProt protonate.out

