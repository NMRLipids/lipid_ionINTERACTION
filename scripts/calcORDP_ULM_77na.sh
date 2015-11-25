tmpDIRname=ULM_77na_OPtmp
mkdir $tmpDIRname
cd $tmpDIRname
cp ../calcORDPulmschneider.sh ./
cp ../gro_OP.awk ./
trajname=/wrk/ollilas1/POPCdata/POPCulmschneider/77na/1m_popc_ulm_200.xtc
tprname402=/wrk/ollilas1/POPCdata/POPCulmschneider/77na/402.tpr
hdbfile=../../scratch/ffgmx2_ULM_POPC.hdb
cp $hdbfile ./ffgmx2.hdb
starttime=0
#endtime=240000
numberOFlipids=128
outFILE=../../Data/POPC/NaCl/ULM/77na/OrderParameters.dat
#Calculate order parameter for each lipid separately
echo 'q
' | make_ndx -f $tprname402
echo 0 | /home/ollilas1/gromacs/gromacs402/bin/trjconv -f $trajname -s $tprname402 -o trjtmpINBOX.xtc -n index.ndx -pbc res -b $starttime #-e $endtime
echo 'keep 2
splitres 0
q
' | make_ndx -f $tprname402
for((  j = 1 ;  j <= $numberOFlipids;  j=j+1  ))
do
    rm runPROT.gro
    echo "$j" | /home/ollilas1/gromacs/gromacs402/bin/protonate -f trjtmpINBOX.xtc -s $tprname402 -o runPROT.gro -n index.ndx
    sh calcORDPulmschneider.sh > OrderParameters_"$j".dat
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
