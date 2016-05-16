#script file destination=/work/girychm1/github/NMRlipids/lipid_ionINTERACTION/scripts/
tmpDIRname=SLIPID_450CAmM_DENStmp
mkdir $tmpDIRname
cd $tmpDIRname
trajname=/m/nbe/work/ollilas1/POPCdata/POPCslipids/450mMCaCl/md_last100ns.xtc
tprname=/m/nbe/work/ollilas1/POPCdata/POPCslipids/450mMCaCl/md.tpr
outFILE=../../Data/POPC/CaCl/SLIPID/450mM/LIPIDdensity.xvg
#trjcat -f popcCHOL50molPER0-25ns.trr popcCHOL50molPER25-50ns.trr
LIPIDname=POPC
LIPIDindexNR=$(echo q | make_ndx -f $tprname | grep $LIPIDname | awk '{if(NR==1)print $1}')
#LIPIDindexNR=2
NAname=NA_d
NAindexNR=$(echo q | make_ndx -f $tprname | grep " CA" | awk '{if(NR==1)print $1}')
#NAindexNR=3
CLindexNR=$(echo q | make_ndx -f $tprname | grep " CL" | awk '{if(NR==1)print $1}')
#CLindexNR=4
echo $LIPIDindexNR System | trjconv -f $trajname -s $tprname -fit progressive -o ANALtraj.xtc
#Ztrans=$(tail -n 1 $groFILE | awk '{print $3/2}')
#echo System | trjconv -f FITtraj.xtc -s $tprname -trans 0 0 $Ztrans -o ANALtraj.xtc
echo $LIPIDindexNR $NAindexNR $CLindexNR | g_density -f ANALtraj.xtc -s $tprname -dens number -o densNC.xvg -xvg none -sl 100 -ng 3
echo System | trjconv -f ANALtraj.xtc -s $tprname -o INBOXtraj.xtc -pbc mol
echo $LIPIDindexNR | g_traj -f INBOXtraj.xtc -s $tprname -ox com.xvg -com -xvg none
Zcom=$(cat com.xvg | awk '{sumZ=sumZ+$4; sum=sum+1}END{print sumZ/sum}')
cat densNC.xvg | awk -v Zcom=$Zcom '{print $1-Zcom" "$2" "$3" "$4}' > $outFILE
rmdir $tmpDIRname

