outfile=../Data/POPC/NaCl/SLIPID/OPvsNACLconsSCALED.dat
rm "$outfile"
echo "     b1           SD        b2          SD         a1          SD       a2        SD       g11        SD       g12        SD       g2        SD       g31        SD       g32        SD" >> $outfile
paste -sd " " ../Data/POPC/NaCl/SLIPID/0na/OrderParameters.dat > tmp.dat 
awk '{print "0 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/POPC/NaCl/SLIPID/130mMscaled/OrderParameters.dat > tmp.dat 
awk '{print "130 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/POPC/NaCl/SLIPID/300mMscaled/OrderParameters.dat > tmp.dat 
awk '{print "300 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/POPC/NaCl/SLIPID/500mMscaled/OrderParameters.dat > tmp.dat 
awk '{print "500 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/POPC/NaCl/SLIPID/750mMscaled/OrderParameters.dat > tmp.dat 
awk '{print "750 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/POPC/NaCl/SLIPID/1000mMscaled/OrderParameters.dat > tmp.dat 
awk '{print "1000 "$0}' tmp.dat >> "$outfile" 
rm tmp.dat
