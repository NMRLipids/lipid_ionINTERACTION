#set term postscript enhanced color  
set terminal postscript portrait enhanced color dashed lw 1 "Helvetica" 14 
set output "../OrderParameterIONSchanges.eps"
set size 1.4, 0.89
set multiplot  layout 2,2
set xrange [-1:1050] 
set ytic 0.01
#set key above
set key at screen 0.6,screen 0.88 maxcols 1 maxrows 10	
set key font ",13"


set yrange [-0.08:0.01]
set ylabel "{/Symbol b}   {/Symbol D}S_{CH}"
set origin 0,0.35
set size 0.65, 0.35
plot "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-NaClchange.dat"  using 1:($2*-0.00784) title 'DPPC+NaCl, ^2H NMR, T=323K' with linespoints  linetype 1 pt 7 lc rgb 'black', \
     "../../Data/POPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1, "" using 1:2 with linespoint title 'POPC+NaCl, Berger, T=298K' pt 5 linetype 1, \
     "../../Data/POPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1, "" using 1:4 with lines notitle linetype 1, \
     "../../scratch/MACROGnaclCONSchange.dat" using 1:2 title 'POPC+NaCl, MacRog, T=310K' with linespoint linetype 1 pt 5 lc rgb 'blue', \
     "../../scratch/MACROGnaclCONSchange.dat" using 1:3 notitle with linespoints  linetype 1 pt 5 lc rgb 'blue', \
     "../../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb 'green', "" using 1:2 with linespoint title 'POPC+NaCl, CHARMM, T=303K' pt 5 linetype 1 lc rgb 'green', \
     "../../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb 'green', "" using 1:4 with lines notitle linetype 1 lc rgb 'green', \
     "../../Data/POPC/NaCl/ORANGE/ORANGEnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb 'orange', "" using 1:2 with linespoint title 'POPC+NaCl, ORANGE, T=298K' pt 5 linetype 1 lc rgb 'orange', \
     "../../Data/POPC/NaCl/ORANGE/ORANGEnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb 'orange', "" using 1:4 with lines notitle linetype 1 lc rgb 'orange', \
     "../../Data/POPC/NaCl/LIPID14/LIPID14naclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb 'yellow', "" using 1:2 with linespoint title 'POPC+NaCl, LIPID14, T=298K' pt 5 linetype 1 lc rgb 'yellow', \
     "../../Data/POPC/NaCl/LIPID14/LIPID14naclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb 'yellow', "" using 1:4 with lines notitle linetype 1 lc rgb 'yellow', \
     "../../Data/POPC/NaCl/ULM/ULMnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb 'pink', "" using 1:2 with linespoint title 'POPC+NaCl, Ulmschneiders, T=298K' pt 5 linetype 1 lc rgb 'pink', \
     "../../Data/POPC/NaCl/ULM/ULMnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb 'pink', "" using 1:4 with lines notitle linetype 1 lc rgb 'pink', \
     "../../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb 'brown', "" using 1:2 with linespoint title 'DPPC+NaCl, Berger-OPLS, T=323K' pt 7 linetype 1 lc rgb 'brown', \
     "../../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb 'brown', "" using 1:4 with lines notitle linetype 1 lc rgb 'brown', \
     "../../scratch/SLIPIDSnaclCONSchangeDPPC.dat" using 1:2 title 'DPPC+NaCl, Slipid, T=323K' with linespoint linetype 1 pt 7 lc rgb 'violet', \
     "../../scratch/SLIPIDSnaclCONSchangeDPPC.dat" using 1:3 notitle with linespoints  linetype 1 pt 7 lc rgb 'violet', \
     "../../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 7 lt 1 lc rgb 'red', "" using 1:2 with linespoint title 'DPPC+NaCl, Berger, T=323K' pt 7 linetype 1 lc rgb 'red', \
     "../../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 7 lt 1 lc rgb 'red', "" using 1:4 with lines notitle linetype 1 lc rgb 'red'


#     "SLIPIDSnaclCONSchangePOPC.dat" using 1:2 title 'POPC+NaCl, Slipid, T=323K' with linespoint linetype 1 pt 9 lc rgb 'violet', \
#     "SLIPIDSnaclCONSchangePOPC.dat" using 1:3 notitle with linespoints  linetype 1 pt 9 lc rgb 'violet'

set key at screen 1.3,screen 0.82 maxcols 2 maxrows 5
#set yrange [-0.11:0.05]
#set ylabel "{/Symbol b}  {/Symbol D}S_{CH}"
set origin 0.7,0.35
set size 0.65, 0.35
plot "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T332.dat"  using 1:($2*-0.00784) title 'DPPC+CaCl_2, ^2H NMR, T=332K' with linespoints  linetype 1 pt 6 lc rgb 'black', \
     "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T323.dat"  using 1:($2*-0.00784) title 'DPPC+CaCl_2, ^2H NMR, T=323K' with linespoints  linetype 1 pt 7 lc rgb 'black', \
     "../../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb 'red', "" using 1:2 with linespoint title 'POPC+CaCl_2, Berger, T=298K' pt 5 linetype 1 lc rgb 'red', \
     "../../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb 'red', "" using 1:4 with lines notitle linetype 1 lc rgb 'red', \
     "../../Data/POPC/CaCl/ORANGE/ORANGEcaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb 'orange', "" using 1:2 with linespoint title 'POPC+CaCl_2, Orange, T=298K' pt 5 linetype 1 lc rgb 'orange', \
     "../../Data/POPC/CaCl/ORANGE/ORANGEcaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb 'orange', "" using 1:4 with lines notitle linetype 1 lc rgb 'orange', \
     "../../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb 'green', "" using 1:2 with linespoint title 'POPC+CaCl_2, CHARMM, T=303K' pt 5 linetype 1 lc rgb 'green', \
     "../../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb 'green', "" using 1:4 with lines notitle linetype 1 lc rgb 'green',\
     "../../Data/POPC/CaCl/LIPID14/LIPID14caclCONSchange.dat" using 1:2:3 with yerrorbars notitle pt 5 lt 1 lc rgb 'yellow', "" using 1:2 with linespoint title 'POPC+CaCl_2, LIPID14, T=298K' pt 5 linetype 1 lc rgb 'yellow', \
     "../../Data/POPC/CaCl/LIPID14/LIPID14caclCONSchange.dat" using 1:4:5 with yerrorbars notitle  pt 5 lt 1 lc rgb 'yellow', "" using 1:4 with lines notitle linetype 1 lc rgb 'yellow'

#set yrange [-0.015:0.11]
set ylabel "{/Symbol a}  {/Symbol D}S_{CH}"
set xlabel "[NaCl] (mM)"
set origin 0,0
set size 0.65, 0.35
plot "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-NaClchange.dat"  using 1:($3*0.00784) notitle with linespoints  linetype 1 pt 7 lc rgb 'black', \
     "../../Data/POPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb 'red', "" using 1:6 with lines notitle linetype 1 lc rgb 'red', \
     "../../Data/POPC/NaCl/BERGER//BERGERnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb 'red', "" using 1:8 with lines notitle linetype 1 lc rgb 'red',\
     "../../scratch/MACROGnaclCONSchange.dat" using 1:4 notitle  with linespoint linetype 1 pt 5 lc rgb 'blue' , \
     "../../scratch/MACROGnaclCONSchange.dat" using 1:5 notitle with linespoints  linetype 1 pt 5 lc rgb 'blue', \
     "../../Data/POPC/NaCl/ORANGE/ORANGEnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb 'orange', "" using 1:6 with lines notitle linetype 1 lc rgb 'orange', \
     "../../Data/POPC/NaCl/ORANGE/ORANGEnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb 'orange', "" using 1:8 with lines notitle linetype 1 lc rgb 'orange',\
     "../../Data/POPC/NaCl/LIPID14/LIPID14naclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb 'yellow', "" using 1:6 with lines notitle linetype 1 lc rgb 'yellow', \
     "../../Data/POPC/NaCl/LIPID14/LIPID14naclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb 'yellow', "" using 1:8 with lines notitle linetype 1 lc rgb 'yellow',\
     "../../Data/POPC/NaCl/ULM/ULMnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb 'pink', "" using 1:6 with lines notitle linetype 1 lc rgb 'pink', \
     "../../Data/POPC/NaCl/ULM/ULMnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb 'pink', "" using 1:8 with lines notitle linetype 1 lc rgb 'pink',\
     "../../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb 'brown', "" using 1:6 with lines notitle linetype 1 lc rgb 'brown', \
     "../../Data/DPPC/NaCl/BERGERopls/BERGERoplsnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb 'brown', "" using 1:8 with lines notitle linetype 1 lc rgb 'brown',\
     "../../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb 'green', "" using 1:6 with lines notitle linetype 1 lc rgb 'green', \
     "../../Data/POPC/NaCl/CHARMM36/CHARMMnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb 'green', "" using 1:8 with lines notitle linetype 1 lc rgb 'green',\
     "../../scratch/SLIPIDSnaclCONSchangeDPPC.dat" using 1:4 notitle with linespoint linetype 1 pt 7 lc rgb 'violet', \
     "../../scratch/SLIPIDSnaclCONSchangeDPPC.dat" using 1:5 notitle with linespoints  linetype 1 pt 7 lc rgb 'violet', \
     "../../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:6:7  with yerrorbars notitle pt 7 lt 1 lc rgb 'red', "" using 1:6 with lines notitle linetype 1 lc rgb 'red', \
     "../../Data/DPPC/NaCl/BERGER/BERGERnaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 7 lt 1 lc rgb 'red', "" using 1:8 with lines notitle linetype 1 lc rgb 'red'

#     "SLIPIDSnaclCONSchangePOPC.dat" using 1:4 notitle with linespoint linetype 1 pt 9 lc rgb 'violet', \
#     "SLIPIDSnaclCONSchangePOPC.dat" using 1:5 notitle with linespoints  linetype 1 pt 9 lc rgb 'violet'


set key at screen 1.3,screen 0.72 maxcols 2 maxrows 6

#set yrange [-0.015:0.11]
#set ylabel "{/Symbol a}  S_{CH}"
set xlabel "[CaCl] (mM)"
set origin 0.7,0
set size 0.65, 0.35
plot "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T332.dat"  using 1:($3*0.00784) notitle with linespoints  linetype 1 pt 6 lc rgb 'black', \
     "../../Data/DPPC/NaCl/EXP-Akutsu1981-DPPC-CaClchange-T323.dat"  using 1:($3*0.00784) notitle with linespoints  linetype 1 pt 7 lc rgb 'black', \
     "../../Data/POPC/NaCl/EXP-Altenbach1984-POPC-CaClchange-T313.dat"  using ($1*1000):($2*0.00784) title 'POPC+CaCl_2, ^2H NMR, T=313K' with linespoints  linetype 1 pt 5 lc rgb 'black', \
     "../../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat" using 1:6:7 with yerrorbars notitle pt 5 lt 1 lc rgb 'red', "" using 1:6 with lines notitle linetype 1 lc rgb 'red', \
     "../../Data/POPC/CaCl/BERGER/BERGERcaclCONSchange.dat" using 1:8:9 with yerrorbars notitle pt 5 lt 1 lc rgb 'red', "" using 1:8 with lines notitle linetype 1 lc rgb 'red',\
     "../../Data/POPC/CaCl/ORANGE/ORANGEcaclCONSchange.dat" using 1:6:7 with yerrorbars notitle pt 5 lt 1 lc rgb 'orange', "" using 1:6 with lines notitle linetype 1 lc rgb 'orange', \
     "../../Data/POPC/CaCl/ORANGE/ORANGEcaclCONSchange.dat" using 1:8:9 with yerrorbars notitle pt 5 lt 1 lc rgb 'orange', "" using 1:8 with lines notitle linetype 1 lc rgb 'orange',\
     "../../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat"  using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb 'green', "" using 1:6 with lines notitle linetype 1 lc rgb 'green', \
     "../../Data/POPC/CaCl/CHARMM36/CHARMMcaclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb 'green', "" using 1:8 with lines notitle linetype 1 lc rgb 'green',\
     "../../Data/POPC/CaCl/LIPID14/LIPID14caclCONSchange.dat"  using 1:6:7  with yerrorbars notitle pt 5 lt 1 lc rgb 'yellow', "" using 1:6 with lines notitle linetype 1 lc rgb 'yellow', \
     "../../Data/POPC/CaCl/LIPID14/LIPID14caclCONSchange.dat" using 1:8:9  with yerrorbars notitle pt 5 lt 1 lc rgb 'yellow', "" using 1:8 with lines notitle linetype 1 lc rgb 'yellow'


unset multiplot

