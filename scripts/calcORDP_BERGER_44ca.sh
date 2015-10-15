tmpDIRname=BERGER_44ca_OPtmp
mkdir $tmpDIRname
cd $tmpDIRname
cp ../calcORDPberger.sh ./
cp ../gro_OP.awk ./
trajname=/wrk/ollilas1/IONS/popcCACL/popcCACL1-2.trr
tprname=/wrk/ollilas1/IONS/popcCACL/popcCACL.tpr
tprname402=/wrk/ollilas1/IONS/popcCACL/run407.tpr
hdbfile=/wrk/ollilas1/IONS/ffgmx2.hdb
cp $hdbfile ./
starttime=0
numberOFlipids=128
outFILE=../../Data/POPC/CaCl/BERGER/44ca/OrderParameters.dat
#Calculate order parameter for each lipid separately
echo 'q
' | make_ndx -f $tprname
echo 0 | trjconv -f $trajname -s $tprname -o trjtmpINBOX.xtc -n index.ndx -pbc res -b $starttime
echo 'keep 2
splitres 0
q
' | make_ndx -f $tprname
for((  j = 1 ;  j <= $numberOFlipids;  j=j+1  ))
do
    rm runPROT.gro
    echo "$j" | /home/ollilas1/gromacs/gromacs402/bin/protonate -f trjtmpINBOX.xtc -s $tprname402 -o runPROT.gro -n index.ndx
    sh calcORDPberger.sh > OrderParameters_"$j".dat
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
