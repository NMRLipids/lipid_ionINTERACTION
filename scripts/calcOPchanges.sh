awk -f calcOPchanges.awk ../Data/POPC/NaCl/CHARMM36/OPvsNACLcons.dat  > ../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat
awk -f calcOPchanges.awk ../Data/POPC/NaCl/CHARMM36_no-NBFIX/OPvsNACLcons.dat  > ../Data/POPC/NaCl/CHARMM36_no-NBFIX/CHARMMnaclCONSchange.dat
awk -f calcOPchanges.awk ../Data/POPC/CaCl/CHARMM36/OPvsCACLcons.dat  > ../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat
awk -f calcOPchanges.awk ../Data/POPC/CaCl/CHARMM36/OPvsCACLconsSCALED.dat  > ../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchangeSCALED.dat

awk -f calcOPchanges.awk ../Data/POPC/NaCl/BERGER/OPvsNACLcons.dat  > ../Data/POPC/NaCl/BERGER/BERGERnaclCONSchange.dat
awk -f calcOPchanges.awk ../Data/POPC/CaCl/BERGER/OPvsCACLcons.dat  > ../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat

awk -f calcOPchanges.awk ../Data/DMPC/DMPC_DMTAP/OPvsDMTAPcons.dat  > ../Data/DMPC/DMPC_DMTAP/BERGERdmtapCONSchange.dat

awk -f calcOPchanges.awk ../Data/POPC/NaCl/ORANGE/OPvsNACLcons.dat  > ../Data/POPC/NaCl/ORANGE/ORANGEnaclCONSchange.dat
awk -f calcOPchanges.awk ../Data/POPC/CaCl/ORANGE/OPvsCACLcons.dat  > ../Data/POPC/CaCl/ORANGE/ORANGEcaclCONSchange.dat

awk -f calcOPchanges.awk ../Data/POPC/NaCl/LIPID14/OPvsNACLcons.dat  > ../Data/POPC/NaCl/LIPID14/LIPID14naclCONSchange.dat
awk -f calcOPchanges.awk ../Data/POPC/CaCl/LIPID14/OPvsCACLcons.dat  > ../Data/POPC/CaCl/LIPID14/LIPID14caclCONSchange.dat

awk -f calcOPchanges.awk ../Data/POPC/NaCl/SLIPID/OPvsNACLconsSD.dat  > ../Data/POPC/NaCl/SLIPID/SLIPIDnaclCONSchangeSD.dat
awk -f calcOPchanges.awk ../Data/DPPC/NaCl/SLIPIDS/OPvsNACLconsRX.dat  > ../Data/DPPC/NaCl/SLIPIDS/SLIPIDnaclCONSchangeRX.dat
awk -f calcOPchanges.awk ../Data/POPC/NaCl/SLIPID/OPvsNACLconsSCALED.dat  > ../Data/POPC/NaCl/SLIPID/SLIPIDnaclCONSchangeSCALED.dat
awk -f calcOPchanges.awk ../Data/POPC/CaCl/SLIPID/OPvsCACLconsSCALED.dat  > ../Data/POPC/CaCl/SLIPID/SLIPIDcaclCONSchangeSCALED.dat
awk -f calcOPchanges.awk ../Data/POPC/CaCl/SLIPID/OPvsCACLcons.dat  > ../Data/POPC/CaCl/SLIPID/SLIPIDcaclCONSchange.dat

awk -f calcOPchanges.awk ../Data/POPC/NaCl/ULM/OPvsNACLcons.dat  > ../Data/POPC/NaCl/ULM/ULMnaclCONSchange.dat

awk -f calcOPchanges.awk ../Data/DPPC/NaCl/BERGERopls/OPvsNACLcons.dat  > ../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchange.dat

awk -f calcOPchanges.awk ../Data/DPPC/NaCl/BERGERopls/OPvsNACLconsSCALED.dat  > ../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchangeSCALED.dat

awk -f calcOPchanges.awk ../Data/DPPC/NaCl/BERGER/OPvsNACLcons.dat  > ../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchange.dat

awk -f calcOPchanges.awk ../Data/DPPC/NaCl/BERGER/OPvsNACLconsSCALED.dat  > ../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchangeSCALED.dat

#cat EXPnaclCONS.dat | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > EXPnaclCONSchange.dat
#cat EXPcaclCONS.dat | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > EXPcaclCONSchange.dat
cat ../Data/DPPC/NaCl/EXP-Akutsu1981.dat | awk '{if($0!~"#") print $0}' | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > ../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-NaClchange.dat
cat ../Data/DPPC/CaCl/EXP-Akutsu1981-T332K.dat | awk '{if($0!~"#") print $0}' | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > ../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T332.dat
cat ../Data/DPPC/CaCl/EXP-Akutsu1981-T323K.dat | awk '{if($0!~"#") print $0}' | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > ../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T323.dat
cat ../Data/POPC/CaCl/EXP-Altenbach1984-T313K.dat| awk '{if($0!~"#") print $0}' | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > ../Data/POPC/NaCl/EXP-Altenbach1984-POPC-CaClchange-T313.dat

cat ../Data/DMPC/DMPC_DMTAP/EXP-franzin1998.dat | awk '{if($0!~"#") print $0}' | awk '{if(NR==1){a=$2;b=$3}print $1" " $2-a" "$3-b}' > ../Data/DMPC/DMPC_DMTAP/EXP-franzin1998change.dat

