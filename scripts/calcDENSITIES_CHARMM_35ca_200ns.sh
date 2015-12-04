#script file destination=/work/girychm1/github/NMRlipids/lipid_ionINTERACTION/scripts/
tmpDIRname=CHARMM_35ca_DENStmp
mkdir $tmpDIRname
cd $tmpDIRname
trajname=/work/girychm1/24_11_15/035m_popc_crm/gromacs/035m_popc_crm_200ns.xtc
tprname=/work/girychm1/24_11_15/035m_popc_crm/gromacs/200ns_run.tpr
mappingFILE=../../MAPPING/mappingPOPCcharmm.txt
outFILE=../../Data/POPC/CaCl/CHARMM36/35ca/LIPIDdensity_200ns.xvg
groFILE=/work/girychm1/24_11_15/035m_popc_crm/gromacs/confout.gro
#trjcat -f popcCHOL50molPER0-25ns.trr popcCHOL50molPER25-50ns.trr
LIPIDname=$(grep M_POPC_M $mappingFILE | awk '{printf "%5s\n",$2}')
LIPIDindexNR=$(echo q | make_ndx -f $tprname | grep $LIPIDname | awk '{if(NR==1)print $1}')
#LIPIDindexNR=2
NAname=$(grep M_NA_M $mappingFILE | awk '{printf " %5s\n",$2}')
NAindexNR=$(echo q | make_ndx -f $tprname | grep " CA" | awk '{if(NR==1)print $1}')
#NAindexNR=3
CLindexNR=$(echo q | make_ndx -f $tprname | grep " CL" | awk '{if(NR==1)print $1}')
#CLindexNR=4
echo $LIPIDindexNR System | trjconv -f $trajname -s $tprname -fit progressive -o ANALtraj.xtc -b 150000 -e 200000
#Ztrans=$(tail -n 1 $groFILE | awk '{print $3/2}')
#echo System | trjconv -f FITtraj.xtc -s $tprname -trans 0 0 $Ztrans -o ANALtraj.xtc
echo $LIPIDindexNR $NAindexNR $CLindexNR | g_density -f ANALtraj.xtc -s $tprname -dens number -o densNC.xvg -xvg none -sl 100 -ng 3
echo System | trjconv -f ANALtraj.xtc -s $tprname -o INBOXtraj.xtc -pbc mol
echo $LIPIDindexNR | g_traj -f INBOXtraj.xtc -s $tprname -ox com.xvg -com -xvg none
Zcom=$(cat com.xvg | awk '{sumZ=sumZ+$4; sum=sum+1}END{print sumZ/sum}')
cat densNC.xvg | awk -v Zcom=$Zcom '{print $1-Zcom" "$2" "$3" "$4}' > $outFILE
ls "$tmpDIRname"/*
rmdir $tmpDIRname

