#script file destination=/work/girychm1/github/NMRlipids/lipid_ionINTERACTION/scripts/
tmpDIRname=SLIPID_1000mMsd_DENStmp
mkdir $tmpDIRname
cd $tmpDIRname
trajname=../trajectory.xtc
tprname=../topol.tpr
outFILE=../../Data/DPPC/NaCl/SLIPID/1000mMsd/LIPIDdensity.xvg
#trjcat -f popcCHOL50molPER0-25ns.trr popcCHOL50molPER25-50ns.trr
LIPIDname=DPPC
LIPIDindexNR=$(echo q | gmx make_ndx -f $tprname | grep $LIPIDname | awk '{if(NR==1)print $1}')
#LIPIDindexNR=2
NAname=NA_d
NAindexNR=$(echo q | gmx make_ndx -f $tprname | grep " NA" | awk '{if(NR==1)print $1}')
#NAindexNR=3
CLindexNR=$(echo q | gmx make_ndx -f $tprname | grep " CL" | awk '{if(NR==1)print $1}')
#CLindexNR=4
echo $LIPIDindexNR System | gmx trjconv -f $trajname -s $tprname -fit progressive -o ANALtraj.xtc
#Ztrans=$(tail -n 1 $groFILE | awk '{print $3/2}')
#echo System | trjconv -f FITtraj.xtc -s $tprname -trans 0 0 $Ztrans -o ANALtraj.xtc
echo $LIPIDindexNR $NAindexNR $CLindexNR | gmx density -f ANALtraj.xtc -s $tprname -dens number -o densNC.xvg -xvg none -sl 100 -ng 3
echo System | gmx trjconv -f ANALtraj.xtc -s $tprname -o INBOXtraj.xtc -pbc mol
echo $LIPIDindexNR | gmx traj -f INBOXtraj.xtc -s $tprname -ox com.xvg -com -xvg none
Zcom=$(cat com.xvg | awk '{sumZ=sumZ+$4; sum=sum+1}END{print sumZ/sum}')
cat densNC.xvg | awk -v Zcom=$Zcom '{print $1-Zcom" "$2" "$3" "$4}' > $outFILE

#rmdir $tmpDIRname

