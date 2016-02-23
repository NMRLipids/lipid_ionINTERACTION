# Script to center the bilayer in box and to make molecules whole.
#
# Note, expects FOUR inputs!
#
# Usage example: ./centerTheBilayer.sh mappingPOPCcharmm.txt popcRUN2.tpr popcRUN2.xtc centered.xtc
#
# Markus Miettinen 14Feb2016.

mappingFile=$1 # File containing the names of atoms in this FF.
tprFile=$2     # The input tpr-file.
xtcFile=$3     # The input xtc-file.
outFile=$4     # Name for the output xtc file.

echo
echo "Will now CENTER trajectory ${xtcFile} to ${outFile}."
echo
# make all molecules whole:
echo "Making molecules whole..."
echo "System" \
    | gmx trjconv -pbc whole \
	  -f $xtcFile \
	  -s $tprFile \
	  -o foo.xtc >& center.output
grep Selected center.output
grep frame center.output
grep gcq center.output
#
echo
# center around one lipid tail CH3 to guarantee all lipids in the same box:
#
# Find the name in this FF: 
G1CH3name=`grep M_G1C[0-9]*_M $mappingFile | tail -n1 | awk '{print $2}'`
echo 'The name of the CH3 carbon in sn-1 chain:' $G1CH3name
#
# Find the number of the CH3 atom in the last lipid:
echo -e "a ${G1CH3name}\nq" | gmx make_ndx -f $tprFile -o foo.ndx >& make_ndx.output
G1CH3number=`tail -n1 foo.ndx | awk '{print $NF}'`
echo "The atom number of the last lipid's CH3: " $G1CH3number
rm make_ndx.output
#
# Add it in the index file:
echo '[ centralAtom ]' >> foo.ndx
echo $G1CH3number >> foo.ndx
#
# Center everything around it:
echo "Centering molecules around atom ${G1CH3number}..."
echo -e "centralAtom\nSystem" \
    | gmx trjconv -center -pbc mol \
	  -n foo.ndx \
	  -f foo.xtc \
	  -s $tprFile \
	  -o foo2.xtc >& center.output
grep Selected center.output
grep gcq center.output
rm center.output foo.ndx foo.xtc
#
echo
# Find the g3 carbons:
# ... find their name in this FF:
G1g3name=`grep M_G3_M $mappingFile | awk '{print $2}'`
echo 'The name of the g3 carbon:' $G1g3name
# ... and put them all to an index file:
echo -e "a ${G1g3name}\nq" | gmx make_ndx -f $tprFile -o foo.ndx >& make_ndx.output
rm make_ndx.output
# Center around CoM of g3 carbons, that is, center of bilayer, and make molecules whole:
echo "Centering around the center of mass of ${G1g3name} atoms..."
echo -e "${G1g3name}\nSystem" \
    | gmx trjconv -center -pbc mol \
	  -n foo.ndx \
	  -f foo2.xtc \
	  -s $tprFile \
	  -o $outFile >& center.output
grep Selected center.output
grep gcq center.output
rm center.output foo2.xtc foo.ndx
echo

