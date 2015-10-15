awk -f calcOPchanges.awk ../Data/POPC/NaCl/CHARMM36/OPvsNACLcons.dat  > ../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat
awk -f calcOPchanges.awk ../Data/POPC/CaCl/CHARMM36/OPvsCACLcons.dat  > ../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat

awk -f calcOPchanges.awk ../Data/POPC/NaCl/BERGER/OPvsNACLcons.dat  > ../Data/POPC/NaCl/BERGER/BERGERnaclCONSchange.dat
awk -f calcOPchanges.awk ../Data/POPC/CaCl/BERGER/OPvsCACLcons.dat  > ../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat


#cat EXPnaclCONS.dat | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > EXPnaclCONSchange.dat
#cat EXPcaclCONS.dat | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > EXPcaclCONSchange.dat
cat ../Data/DPPC/NaCl/EXP-Akutsu1981.dat | awk '{if($0!~"#") print $0}' | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > ../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-NaClchange.dat
cat ../Data/DPPC/CaCl/EXP-Akutsu1981-T332K.dat | awk '{if($0!~"#") print $0}' | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > ../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T332.dat
cat ../Data/DPPC/CaCl/EXP-Akutsu1981-T323K.dat | awk '{if($0!~"#") print $0}' | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > ../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T323.dat
cat ../Data/POPC/CaCl/EXP-Altenbach1984-T313K.dat| awk '{if($0!~"#") print $0}' | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > ../Data/POPC/NaCl/EXP-Altenbach1984-POPC-CaClchange-T313.dat

