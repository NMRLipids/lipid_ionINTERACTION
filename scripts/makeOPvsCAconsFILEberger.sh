outfile=../Data/POPC/CaCl/BERGER/OPvsCACLcons.dat
rm $outfile
echo "     b1           SD        b2          SD         a1          SD       a2        SD       g11        SD       g12        SD       g2        SD       g31        SD       g32        SD" >> $outfile
paste -sd " " ../Data/POPC/NaCl/BERGER/0na/OrderParameters.dat > tmp.dat 
awk '{print "0 "$0}' tmp.dat >> $outfile
paste -sd " " ../Data/POPC/CaCl/BERGER/44ca/OrderParameters.dat > tmp.dat 
awk '{print "340 "$0}' tmp.dat >> $outfile
rm tmp.dat
