tmpDIRname=BERGERopls_8na_DENStmp
mkdir $tmpDIRname
cd $tmpDIRname
trajname=/wrk/ollilas1/DPPCdata/DPPCbergerOPLS/8na/md.xtc
tprname=/wrk/ollilas1/DPPCdata/DPPCbergerOPLS/8na/402.tpr
#mappingFILE=/wrk/ollilas1/POPCdata/POPCorange/mappingPOPCorange.txt
outFILE=../../Data/DPPC/NaCl/BERGERopls/8na/LIPIDdensity.xvg
#LIPIDname=$(grep M_POPC_M $mappingFILE | awk '{printf "%5s\n",$2}')
LIPIDindexNR=$(echo q | make_ndx -f $tprname | grep DPPC | awk '{if(NR==1)print $1}')
#CAname=$(grep M_CA_M $mappingFILE | awk '{printf " %5s\n",$2}')
CAindexNR=$(echo q | make_ndx -f $tprname | grep " NA" | awk '{if(NR==1)print $1}')
CLindexNR=$(echo q | make_ndx -f $tprname | grep " CL" | awk '{if(NR==1)print $1}')
echo $LIPIDindexNR System | trjconv -f $trajname -s $tprname -fit progressive -o FITtraj.xtc
#Ztrans=$(tail -n 1 $groFILE | awk '{print $3/2}')
Ztrans=-1
echo System | trjconv -f FITtraj.xtc -s $tprname -trans 0 0 $Ztrans -o ANALtraj.xtc
echo $LIPIDindexNR $CAindexNR $CLindexNR | g_density -f ANALtraj.xtc -s $tprname -dens number -o densNC.xvg -xvg none -sl 100 -ng 3
echo System | trjconv -f ANALtraj.xtc -s $tprname -o INBOXtraj.xtc -pbc mol
echo $LIPIDindexNR | g_traj -f INBOXtraj.xtc -s $tprname -ox com.xvg -com -xvg none
Zcom=$(cat com.xvg | awk '{sumZ=sumZ+$4; sum=sum+1}END{print sumZ/sum}')
cat densNC.xvg | awk -v Zcom=$Zcom '{print $1-Zcom" "$2" "$3" "$4}' > $outFILE
rmdir $tmpDIRname

