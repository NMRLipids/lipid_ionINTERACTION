rm ../Data/POPC/NaCl/CHARMM36/OPvsNACLcons.dat
echo "     b1           SD        b2          SD         a1          SD       a2        SD       g11        SD       g12        SD       g2        SD       g31        SD       g32        SD" >> ../Data/POPC/NaCl/CHARMM36/OPvsNACLcons.dat
paste -sd " " ../Data/POPC/NaCl/CHARMM36/0na/OrderParameters.dat > tmp.dat 
awk '{print "0 "$0}' tmp.dat >> ../Data/POPC/NaCl/CHARMM36/OPvsNACLcons.dat
paste -sd " " ../Data/POPC/NaCl/CHARMM36/13na/OrderParameters.dat > tmp.dat 
awk '{print "350 "$0}' tmp.dat >> ../Data/POPC/NaCl/CHARMM36/OPvsNACLcons.dat
paste -sd " " ../Data/POPC/NaCl/CHARMM36/26na/OrderParameters.dat > tmp.dat 
awk '{print "690 "$0}' tmp.dat >> ../Data/POPC/NaCl/CHARMM36/OPvsNACLcons.dat
paste -sd " " ../Data/POPC/NaCl/CHARMM36/37na/OrderParameters.dat > tmp.dat 
awk '{print "950 "$0}' tmp.dat >> ../Data/POPC/NaCl/CHARMM36/OPvsNACLcons.dat
rm tmp.dat
