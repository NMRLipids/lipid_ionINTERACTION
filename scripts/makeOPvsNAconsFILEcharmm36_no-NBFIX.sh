rm ../Data/POPC/NaCl/CHARMM36_no-NBFIX/OPvsNACLcons.dat
echo "     b1           SD        b2          SD         a1          SD       a2        SD       g11        SD       g12        SD       g2        SD       g31        SD       g32        SD" >> ../Data/POPC/NaCl/CHARMM36_no-NBFIX/OPvsNACLcons.dat
paste -sd " " ../Data/POPC/NaCl/CHARMM36_no-NBFIX/0na/OrderParameters.dat > tmp.dat 
awk '{print "0 "$0}' tmp.dat >> ../Data/POPC/NaCl/CHARMM36_no-NBFIX/OPvsNACLcons.dat
paste -sd " " ../Data/POPC/NaCl/CHARMM36_no-NBFIX/730mM/OrderParameters.dat > tmp.dat 
awk '{print "730 "$0}' tmp.dat >> ../Data/POPC/NaCl/CHARMM36_no-NBFIX/OPvsNACLcons.dat
rm tmp.dat
