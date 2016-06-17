#set term postscript enhanced color  
set terminal postscript portrait enhanced color dashed lw 1 "Helvetica" 14 
set output "../OrderParameterIONSchanges.eps"
set size 1.53, 0.89
set multiplot  layout 2,2
set xrange [-1:1050] 
set ytic 0.01
#set key above

#set style line ls_forKey lt 1 ps 1.5*r lc rgb "black"
#set style line ls_berger lt 1 dt 1 lw w lc rgb "#D70039"
#set style line ls_beOPLS lt 1 dt 3 lw w lc rgb "#D70039"
#set style line ls_chrm36 lt 1 dt 1 lw w lc rgb "#0088BF"
#set style line ls_lipd14 lt 1 dt 1 lw w lc rgb "#FFD300"
#set style line ls_macrog lt 1 dt 1 lw w lc rgb "#00A368"
#set style line ls_orange lt 1 dt 1 lw w lc rgb "#FF6600"
#set style line ls_ulmsch lt 1 dt 1 lw w lc rgb "#FFA0A3"
#set style line ls_slipid lt 1 dt 1 lw w lc rgb "#7AEE9E"

#set object 200 rectangle center screen 1.09, screen 0.77 size screen 0.2, screen 0.0 fs solid noborder
set object 201 rectangle center screen 1.24, screen 0.75 size screen 0.15, screen 0.08 fs empty
set label 1 at screen 1.18, screen 0.77 "POPC" # font ",20"
set label 2 at screen 1.18, screen 0.73 "DPPC" # font ",20"
#set label 3 at screen 1.140, screen 0.795 "NaCl" # font ",20"
#set label 4 at screen 1.260, screen 0.795 "CaCl_2" # font ",20"


set key at screen 0.75,screen 0.889 maxcols 2 maxrows 5	reverse Left
set key font ",13"
set xtics format " "
set yrange [-0.079:0.01]
set ylabel "{/Symbol D}S_{CH}^{/Symbol b}"
set origin 0,0.39
set size 0.8, 0.45
plot "../../Data/POPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#D70039', "" using 1:2 with linespoint title 'Berger' pt 7 linetype 1 lc rgb '#D70039', \
     "../../Data/POPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#D70039', "" using 1:4 with lines notitle linetype 1 lc rgb '#D70039', \
     "../../scratch/MACROGnaclCONSchange.dat" using 1:2 title 'MacRog' with linespoint linetype 1 pt 7 lc rgb '#00A368', \
     "../../scratch/MACROGnaclCONSchange.dat" using 1:3 notitle with linespoints  linetype 1 pt 7 lc rgb '#00A368', \
     "../../Data/POPC/NaCl/ORANGE/ORANGEnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#FF6600', "" using 1:2 with linespoint title 'ORANGE' pt 7 linetype 1 lc rgb '#FF6600', \
     "../../Data/POPC/NaCl/ORANGE/ORANGEnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#FF6600', "" using 1:4 with lines notitle linetype 1 lc rgb '#FF6600', \
     "../../Data/POPC/NaCl/LIPID14/LIPID14naclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#FFD300', "" using 1:2 with linespoint title 'LIPID14' pt 7 linetype 1 lc rgb '#FFD300', \
     "../../Data/POPC/NaCl/LIPID14/LIPID14naclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#FFD300', "" using 1:4 with lines notitle linetype 1 lc rgb '#FFD300', \
     "../../Data/POPC/NaCl/ULM/ULMnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#FFA0A3', "" using 1:2 with linespoint title 'Ulmschneiders' pt 7 linetype 1 lc rgb '#FFA0A3', \
     "../../Data/POPC/NaCl/ULM/ULMnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#FFA0A3', "" using 1:4 with lines notitle linetype 1 lc rgb '#FFA0A3', \
     "../../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb 'brown', "" using 1:2 with linespoint title 'Berger-OPLS' pt 5 linetype 1 lc rgb 'brown', \
     "../../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb 'brown', "" using 1:4 with lines notitle linetype 1 lc rgb 'brown', \
     "../../Data/POPC/NaCl/SLIPID/SLIPIDnaclCONSchangeSD.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#7AEE9E', "" using 1:2 with linespoint title 'Slipid' pt 7 linetype 1 lc rgb '#7AEE9E', \
     "../../Data/POPC/NaCl/SLIPID/SLIPIDnaclCONSchangeSD.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#7AEE9E', "" using 1:4 with lines notitle linetype 1 lc rgb '#7AEE9E', \
     "../../Data/DPPC/NaCl/SLIPIDS/SLIPIDnaclCONSchangeRX.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb '#7AEE9E', "" using 1:2 with linespoint notitle pt 5 linetype 1 lc rgb '#7AEE9E', \
     "../../Data/DPPC/NaCl/SLIPIDS/SLIPIDnaclCONSchangeRX.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb '#7AEE9E', "" using 1:4 with lines notitle linetype 1 lc rgb '#7AEE9E', \
     "../../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb '#D70039', "" using 1:2 with linespoint notitle pt 5 linetype 1 lc rgb '#D70039', \
     "../../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb '#D70039', "" using 1:4 with lines notitle linetype 1 lc rgb '#D70039',\
     "../../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#0088BF', "" using 1:2 with linespoint title 'CHARMM36' pt 7 linetype 1 lc rgb '#0088BF', \
     "../../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#0088BF', "" using 1:4 with lines notitle linetype 1 lc rgb '#0088BF', \
     "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-NaClchange.dat"  using 1:($2*-0.00784) notitle  with linespoints lw 5 linetype 1 pt 5 lc rgb 'black'


set xtics format " "			
set ytics format " "
set y2tic 0.01
set y2range [-0.079:0.01]				   
set key at screen 1.1,screen 0.889 maxcols 2 maxrows 8
unset ylabel
set y2label "{/Symbol D}S_{CH}^{/Symbol b}" 
set origin 0.72,0.39
set size 0.85, 0.45
plot "../../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#D70039', "" using 1:2 with linespoint notitle  pt 7 linetype 1 lc rgb '#D70039', \
     "../../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#D70039', "" using 1:4 with lines notitle linetype 1 lc rgb '#D70039', \
     "../../Data/POPC/CaCl/ORANGE/ORANGEcaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#FF6600', "" using 1:2 with linespoint notitle pt 7 linetype 1 lc rgb '#FF6600', \
     "../../Data/POPC/CaCl/ORANGE/ORANGEcaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#FF6600', "" using 1:4 with lines notitle linetype 1 lc rgb '#FF6600', \
     "../../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#0088BF', "" using 1:2 with linespoint notitle  pt 7 linetype 1 lc rgb '#0088BF', \
     "../../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#0088BF', "" using 1:4 with lines notitle linetype 1 lc rgb '#0088BF',\
     "../../Data/DPPC/CaCl/CHARMM36/CHARMMcaclCONSchangeYOO.dat" using 1:2:3 with yerrorbars notitle pt 4 lt 1 lc rgb '#0088BF', "" using 1:2 with linespoint title 'CHARMM YOO' pt 4 linetype 1 lc rgb '#0088BF', \
     "../../Data/DPPC/CaCl/CHARMM36/CHARMMcaclCONSchangeYOO.dat" using 1:4:5 with yerrorbars notitle  pt 4 lt 1 lc rgb '#0088BF', "" using 1:4 with lines notitle linetype 1 lc rgb '#0088BF',\
     "../../Data/POPC/CaCl/LIPID14/LIPID14caclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#FFD300', "" using 1:2 with linespoint notitle pt 7 linetype 1 lc rgb '#FFD300', \
     "../../Data/POPC/CaCl/LIPID14/LIPID14caclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#FFD300', "" using 1:4 with lines notitle linetype 1 lc rgb '#FFD300', \
     "../../Data/POPC/CaCl/SLIPID/SLIPIDcaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb '#7AEE9E', "" using 1:2 with linespoint notitle pt 7 linetype 1 lc rgb '#7AEE9E', \
     "../../Data/POPC/CaCl/SLIPID/SLIPIDcaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb '#7AEE9E', "" using 1:4 with lines notitle linetype 1 lc rgb '#7AEE9E',\
     "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T332.dat"  using 1:($2*-0.00784) notitle  with linespoints  lw 5 linetype 1 pt 4 lc rgb 'black', \
     "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T323.dat"  using 1:($2*-0.00784) notitle with linespoints  lw 5 linetype 1 pt 5 lc rgb 'black', \
     "forKeyOPfig.dat" ev :::0::0 notitle pt 7 lc rgb 'black', \
     "forKeyOPfig.dat" ev :::1::1 notitle pt 5 lc rgb 'black',\
#     "forKeyOPfig.dat" ev :::2::2 notitle pt 7 lc rgb 'black', \
#     "forKeyOPfig.dat" ev :::3::3 notitle pt 5 lc rgb 'black'

unset y2label
set xtics format "%G"
unset y2tics
set ytics format "%G"
set ylabel "{/Symbol D}S_{CH}^{/Symbol a}"
set xlabel "[NaCl] (mM)"
set origin 0,0
set size 0.8, 0.45
plot "../../Data/POPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb '#D70039', "" using 1:6 with lines notitle linetype 1 lc rgb '#D70039', \
     "../../Data/POPC/NaCl/BERGER//BERGERnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb '#D70039', "" using 1:8 with lines notitle linetype 1 lc rgb '#D70039',\
     "../../scratch/MACROGnaclCONSchange.dat" using 1:4 notitle  with linespoint linetype 1 pt 7 lc rgb '#00A368' , \
     "../../scratch/MACROGnaclCONSchange.dat" using 1:5 notitle with linespoints  linetype 1 pt 7 lc rgb '#00A368', \
     "../../Data/POPC/NaCl/ORANGE/ORANGEnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb '#FF6600', "" using 1:6 with lines notitle linetype 1 lc rgb '#FF6600', \
     "../../Data/POPC/NaCl/ORANGE/ORANGEnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb '#FF6600', "" using 1:8 with lines notitle linetype 1 lc rgb '#FF6600',\
     "../../Data/POPC/NaCl/LIPID14/LIPID14naclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb '#FFD300', "" using 1:6 with lines notitle linetype 1 lc rgb '#FFD300', \
     "../../Data/POPC/NaCl/LIPID14/LIPID14naclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb '#FFD300', "" using 1:8 with lines notitle linetype 1 lc rgb '#FFD300',\
     "../../Data/POPC/NaCl/ULM/ULMnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb '#FFA0A3', "" using 1:6 with lines notitle linetype 1 lc rgb '#FFA0A3', \
     "../../Data/POPC/NaCl/ULM/ULMnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb '#FFA0A3', "" using 1:8 with lines notitle linetype 1 lc rgb '#FFA0A3',\
     "../../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb 'brown', "" using 1:6 with lines notitle linetype 1 lc rgb 'brown', \
     "../../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb 'brown', "" using 1:8 with lines notitle linetype 1 lc rgb 'brown',\
     "../../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb '#0088BF', "" using 1:6 with lines notitle linetype 1 lc rgb '#0088BF', \
     "../../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb '#0088BF', "" using 1:8 with lines notitle linetype 1 lc rgb '#0088BF',\
     "../../Data/POPC/NaCl/SLIPID/SLIPIDnaclCONSchangeSD.dat" using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb '#7AEE9E', "" using 1:6 with lines notitle linetype 1 lc rgb '#7AEE9E', \
     "../../Data/POPC/NaCl/SLIPID/SLIPIDnaclCONSchangeSD.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb '#7AEE9E', "" using 1:8 with lines notitle linetype 1 lc rgb '#7AEE9E',\
     "../../Data/DPPC/NaCl/SLIPIDS/SLIPIDnaclCONSchangeRX.dat" using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb '#7AEE9E', "" using 1:6 with lines notitle linetype 1 lc rgb '#7AEE9E', \
     "../../Data/DPPC/NaCl/SLIPIDS/SLIPIDnaclCONSchangeRX.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb '#7AEE9E', "" using 1:8 with lines notitle linetype 1 lc rgb '#7AEE9E',\
     "../../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb '#D70039', "" using 1:6 with lines notitle linetype 1 lc rgb '#D70039', \
     "../../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb '#D70039', "" using 1:8 with lines notitle linetype 1 lc rgb '#D70039', \
     "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-NaClchange.dat"  using 1:($3*0.00784) notitle with linespoints  lw 5 linetype 1 pt 5 lc rgb 'black'


#     "SLIPIDSnaclCONSchangePOPC.dat" using 1:4 notitle with linespoint linetype 1 pt 9 lc rgb '#7AEE9E', \
#     "SLIPIDSnaclCONSchangePOPC.dat" using 1:5 notitle with linespoints  linetype 1 pt 9 lc rgb '#7AEE9E'


set key at screen 1.16,screen 0.872 maxcols 2 maxrows 6
set xtics format "%G"
set ytics format " "
set y2tics				   
set xlabel "[CaCl] (mM)"
unset ylabel
set y2label "{/Symbol D}S_{CH}^{/Symbol a}" 
set origin 0.72,0
set size 0.85, 0.45
plot "../../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat" using 1:6:7 with yerrorbars notitle pt 7 lt 1 lc rgb '#D70039', "" using 1:6 with lines notitle linetype 1 lc rgb '#D70039', \
     "../../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat" using 1:8:9 with yerrorbars notitle pt 7 lt 1 lc rgb '#D70039', "" using 1:8 with lines notitle linetype 1 lc rgb '#D70039',\
     "../../Data/POPC/CaCl/ORANGE/ORANGEcaclCONSchange.dat" using 1:6:7 with yerrorbars notitle pt 7 lt 1 lc rgb '#FF6600', "" using 1:6 with lines notitle linetype 1 lc rgb '#FF6600', \
     "../../Data/POPC/CaCl/ORANGE/ORANGEcaclCONSchange.dat" using 1:8:9 with yerrorbars notitle pt 7 lt 1 lc rgb '#FF6600', "" using 1:8 with lines notitle linetype 1 lc rgb '#FF6600',\
     "../../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat"  using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb '#0088BF', "" using 1:6 with lines notitle linetype 1 lc rgb '#0088BF', \
     "../../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb '#0088BF', "" using 1:8 with lines notitle linetype 1 lc rgb '#0088BF',\
     "../../Data/DPPC/CaCl/CHARMM36/CHARMMcaclCONSchangeYOO.dat"  using 1:6:7  with yerrorbars notitle pt 4 lt 1 lc rgb '#0088BF', "" using 1:6 with lines notitle linetype 1 lc rgb '#0088BF', \
     "../../Data/DPPC/CaCl/CHARMM36/CHARMMcaclCONSchangeYOO.dat" using 1:8:9  with yerrorbars notitle pt 4 lt 1 lc rgb '#0088BF', "" using 1:8 with lines notitle linetype 1 lc rgb '#0088BF',\
     "../../Data/POPC/CaCl/LIPID14/LIPID14caclCONSchange.dat"  using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb '#FFD300', "" using 1:6 with lines notitle linetype 1 lc rgb '#FFD300', \
     "../../Data/POPC/CaCl/LIPID14/LIPID14caclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb '#FFD300', "" using 1:8 with lines notitle linetype 1 lc rgb '#FFD300',\
     "../../Data/POPC/CaCl/SLIPID/SLIPIDcaclCONSchange.dat"  using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb '#7AEE9E', "" using 1:6 with lines notitle linetype 1 lc rgb '#7AEE9E', \
     "../../Data/POPC/CaCl/SLIPID/SLIPIDcaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb '#7AEE9E', "" using 1:8 with lines notitle linetype 1 lc rgb '#7AEE9E',\
     "../../Data/POPC/NaCl/EXP-Altenbach1984-POPC-CaClchange-T313.dat"  using ($1*1000):($2*0.00784) title '^2H NMR (T=313K)' with linespoints  lw 5 linetype 1 pt 7 lc rgb 'black', \
     "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T332.dat"  using 1:($3*0.00784) title '^2H NMR (T=332K)' with linespoints  lw 5 linetype 1 pt 4 lc rgb 'black', \
     "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T323.dat"  using 1:($3*0.00784) title '^2H NMR (T=323K)' with linespoints  lw 5 linetype 1 pt 5 lc rgb 'black', \



unset multiplot

