tmpDIRname=CHARMM36_73ca_DENStmp
mkdir $tmpDIRname
cd $tmpDIRname
trajname=/m/nbe/work/ollilas1/POPCdata/POPCcharmm/POPCcacl/450mMlong/md_last100ns.xtc
tprname=/m/nbe/work/ollilas1/POPCdata/POPCcharmm/POPCcacl/450mMlong/md.tpr
mappingFILE=../../../NmrLipidsCholXray/MAPPING/mappingPOPCcharmm.txt
outFILE=../../Data/POPC/CaCl/CHARMM36/450mMlong/LIPIDdensity.xvg
#groFILE=/wrk/ollilas1/POPCdata/POPCcharmm/POPCcacl/450mM/start.gro
#trjcat -f popcCHOL50molPER0-25ns.trr popcCHOL50molPER25-50ns.trr
LIPIDname=$(grep M_POPC_M $mappingFILE | awk '{printf "%5s\n",$2}')
LIPIDindexNR=$(echo q | make_ndx -f $tprname | grep $LIPIDname | awk '{if(NR==1)print $1}')
CAname=$(grep M_CA_M $mappingFILE | awk '{printf " %5s\n",$2}')
CAindexNR=$(echo q | make_ndx -f $tprname | grep " CA" | awk '{if(NR==1)print $1}')
CLindexNR=$(echo q | make_ndx -f $tprname | grep " CL" | awk '{if(NR==1)print $1}')
echo $LIPIDindexNR System | trjconv -f $trajname -s $tprname -fit progressive -o FITtraj.xtc
#Ztrans=$(tail -n 1 $groFILE | awk '{print $3/2}')
Ztrans=0
echo System | trjconv -f FITtraj.xtc -s $tprname -trans 0 0 $Ztrans -o ANALtraj.xtc
echo $LIPIDindexNR 10 11 | g_density -f ANALtraj.xtc -s $tprname -dens number -o densNC.xvg -xvg none -sl 100 -ng 3
echo System | trjconv -f ANALtraj.xtc -s $tprname -o INBOXtraj.xtc -pbc mol
echo $LIPIDindexNR | g_traj -f INBOXtraj.xtc -s $tprname -ox com.xvg -com -xvg none
Zcom=$(cat com.xvg | awk '{sumZ=sumZ+$4; sum=sum+1}END{print sumZ/sum}')
cat densNC.xvg | awk -v Zcom=$Zcom '{print $1-Zcom" "$2" "$3" "$4}' > $outFILE
ls "$tmpDIRname"/*
rmdir $tmpDIRname
