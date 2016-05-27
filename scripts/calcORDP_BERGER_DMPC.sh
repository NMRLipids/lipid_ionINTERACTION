#!/bin/bash
tmpDIRname=BERGER_DMPC_OPtmp
mkdir $tmpDIRname
cd $tmpDIRname
cp ../calcORDPbergerDMPC.sh ./
cp ../gro_OP.awk ./
trajname=/m/nbe/work/ollilas1/DMPCdata/DMPCberger/DMPC_DMTAP/0DMTAP/dmpc128W_21-130ns.xtc 
tprname=/m/nbe/work/ollilas1/DMPCdata/DMPCberger/DMPC_DMTAP/0DMTAP/dmpc128W_1ns.tpr
tprname402=/m/nbe/work/ollilas1/DMPCdata/DMPCberger/DMPC_DMTAP/0DMTAP/dmpc128W_1ns.tpr
hdbfile=/m/nbe/work/ollilas1/DMPCdata/ffgmx2.hdb
cp $hdbfile ./
starttime=0
numberOFlipids=128
outFILE=../../Data/DMPC/DMPC_DMTAP/0DMTAP/OrderParameters.dat
#Calculate order parameter for each lipid separately
echo 'q
' | /m/nbe/home/ollilas1/gromacs/gromacs334/bin/make_ndx -f $tprname
echo 0 | /m/nbe/home/ollilas1/gromacs/gromacs334/bin/trjconv -f $trajname -s $tprname -o trjtmpINBOX.xtc -n index.ndx -pbc res -b $starttime
echo 'keep 1
splitres 0
q
' | /m/nbe/home/ollilas1/gromacs/gromacs334/bin/make_ndx -f $tprname
for((  j = 1 ;  j <= $numberOFlipids;  j=j+1  ))
do
    rm runPROT.gro
    echo "$j" | /m/nbe/home/ollilas1/gromacs/gromacs402/bin/protonate -f trjtmpINBOX.xtc -s $tprname402 -o runPROT.gro -n index.ndx
    sh calcORDPbergerDMPC.sh > OrderParameters_"$j".dat
done
#Calculate average and the error of the mean of order parameters over lipids.
echo '0
0
0
0
0
0
0
0
0' > OrderParametersSUM.dat
echo '0
0
0
0
0
0
0
0
0' > OrderParametersSDsum.dat
for((  j = 1 ;  j <= $numberOFlipids;  j=j+1  ))
do
    paste OrderParametersSUM.dat OrderParameters_"$j".dat | awk '{print $1+$2}' > tmp.dat
    mv tmp.dat OrderParametersSUM.dat
    sum=$(($sum+1))
done
cat OrderParametersSUM.dat | awk -v sum=$sum '{print $1/sum}' > OrderParametersAV.dat
sum=0
for((  j = 1 ;  j <= $numberOFlipids;  j=j+1  ))
do
    paste OrderParametersAV.dat OrderParameters_"$j".dat OrderParametersSDsum.dat | awk '{print $3+($1-$2)*($1-$2)}' > tmp.dat
    mv tmp.dat OrderParametersSDsum.dat
    sum=$(($sum+1))
done
paste OrderParametersAV.dat OrderParametersSDsum.dat | awk -v sum=$sum '{print $1" "sqrt($2/sum)/sqrt(sum)}' > $outFILE
cd ..
rm $tmpDIRname/*
rmdir $tmpDIRname
