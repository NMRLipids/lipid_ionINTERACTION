outfile=../Data/DPPC/NaCl/BERGERopls/OPvsNACLconsSCALED.dat
rm "$outfile"
echo "     b1           SD        b2          SD         a1          SD       a2        SD       g11        SD       g12        SD       g2        SD       g31        SD       g32        SD" >> $outfile
paste -sd " " ../Data/DPPC/NaCl/BERGERopls/0na/OrderParameters.dat > tmp.dat 
awk '{print "0 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/DPPC/NaCl/BERGERopls/8naSCALED/OrderParameters.dat > tmp.dat 
awk '{print "150 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/DPPC/NaCl/BERGERopls/51naSCALED/OrderParameters.dat > tmp.dat 
awk '{print "1000 "$0}' tmp.dat >> "$outfile" 
rm tmp.dat
