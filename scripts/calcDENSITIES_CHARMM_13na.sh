tmpDIRname=CHARMM36_13na_DENStmp
mkdir $tmpDIRname
cd $tmpDIRname
cp ../calcORDPcharmm.sh ./
cp ../gro_OP.awk ./
trajname=/wrk/ollilas1/POPCdata/POPCcharmm/POPCnacl/13na/popcRUN2-4.trr
tprname=/wrk/ollilas1/POPCdata/POPCcharmm/POPCnacl/13na/popcRUN2.tpr
mappingFILE=../../../NmrLipidsCholXray/MAPPING/mappingPOPCcharmm.txt
outFILE=../../Data/POPC/NaCl/CHARMM36/13na/LIPIDdensity.xvg
groFILE=/wrk/ollilas1/POPCdata/POPCcharmm/POPCnacl/13na/popcRUN2.gro
#trjcat -f popcCHOL50molPER0-25ns.trr popcCHOL50molPER25-50ns.trr
LIPIDname=$(grep M_POPC_M $mappingFILE | awk '{printf "%5s\n",$2}')
LIPIDindexNR=$(echo q | make_ndx -f $tprname | grep $LIPIDname | awk '{if(NR==1)print $1}')
NAname=$(grep M_NA_M $mappingFILE | awk '{printf " %5s\n",$2}')
CLname=$(grep M_NA_M $mappingFILE | awk '{printf " %5s\n",$2}')
NAindexNR=$(echo q | make_ndx -f $tprname | grep " NA" | awk '{if(NR==1)print $1}')
CLindexNR=$(echo q | make_ndx -f $tprname | grep " CL" | awk '{if(NR==1)print $1}')
echo $LIPIDindexNR System | trjconv -f $trajname -s $tprname -fit progressive -o FITtraj.xtc
Ztrans=$(tail -n 1 $groFILE | awk '{print $3/2}')
echo System | trjconv -f FITtraj.xtc -s $tprname -trans 0 0 $Ztrans -o ANALtraj.xtc
echo $LIPIDindexNR $NAindexNR $CLindexNR | g_density -f ANALtraj.xtc -s $tprname -dens number -o densNC.xvg -xvg none -sl 100 -ng 3
echo System | trjconv -f ANALtraj.xtc -s $tprname -o INBOXtraj.xtc -pbc mol
echo $LIPIDindexNR | g_traj -f INBOXtraj.xtc -s $tprname -ox com.xvg -com -xvg none
Zcom=$(cat com.xvg | awk '{sumZ=sumZ+$4; sum=sum+1}END{print sumZ/sum}')
cat densNC.xvg | awk -v Zcom=$Zcom '{print $1-Zcom" "$2" "$3" "$4}' > $outFILE
ls $tmpDIRname/*
rmdir $tmpDIRname

