outfile=../Data/POPC/NaCl/ORANGE/OPvsNACLcons.dat
rm "$outfile"
echo "     b1           SD        b2          SD         a1          SD       a2        SD       g11        SD       g12        SD       g2        SD       g31        SD       g32        SD" >> $outfile
paste -sd " " ../Data/POPC/NaCl/ORANGE/0na/OrderParameters.dat > tmp.dat 
awk '{print "0 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/POPC/NaCl/ORANGE/7na/OrderParameters.dat > tmp.dat 
awk '{print "140 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/POPC/NaCl/ORANGE/26na/OrderParameters.dat > tmp.dat 
awk '{print "510 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/POPC/NaCl/ORANGE/50na/OrderParameters.dat > tmp.dat 
awk '{print "1000 "$0}' tmp.dat >> "$outfile" 
rm tmp.dat
