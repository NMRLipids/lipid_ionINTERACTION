tmpDIRname=LIPID14_0na_OPtmp
mkdir $tmpDIRname
cd $tmpDIRname
cp ../calcORDPlipid14.sh ./
cp ../gro_OP.awk ./
trajname=/work/ollilas1/POPCdata/POPClipid14/0na/0m_popc_amb_0_200ns.xtc
tprname=/work/ollilas1/POPCdata/POPClipid14/0na/run_200ns_gpu.tpr
numberOFlipids=128
outFILE=../../Data/POPC/NaCl/LIPID14/0na/OrderParameters.dat
#Calculate order parameter for each lipid separately
echo 'keep 2
splitres 0
q
' | make_ndx -f $tprname
for((  j = 1 ;  j <= $numberOFlipids;  j=j+1  ))
do
    rm runPROT.gro
    echo "$j" | trjconv -f $trajname -s $tprname -o runPROT.gro -n index.ndx -pbc res
    sh calcORDPlipid14.sh > OrderParameters_"$j".dat
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
