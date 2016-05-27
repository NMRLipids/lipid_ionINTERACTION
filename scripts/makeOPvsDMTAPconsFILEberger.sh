outfile=../Data/DMPC/DMPC_DMTAP/OPvsDMTAPcons.dat
rm "$outfile"
echo "     b1           SD        b2          SD         a1          SD       a2        SD       g11        SD       g12        SD       g2        SD       g31        SD       g32        SD" >> $outfile
paste -sd " " ../Data/DMPC/DMPC_DMTAP/0DMTAP/OrderParameters.dat > tmp.dat 
awk '{print "0 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/DMPC/DMPC_DMTAP/6molDMTAP/OrderParameters.dat > tmp.dat 
awk '{print "6 "$0}' tmp.dat >> "$outfile" 
paste -sd " " ../Data/DMPC/DMPC_DMTAP/50molDMTAP/OrderParameters.dat > tmp.dat 
awk '{print "50 "$0}' tmp.dat >> "$outfile" 
rm tmp.dat
