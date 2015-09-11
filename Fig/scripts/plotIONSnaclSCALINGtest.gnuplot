#set term postscript enhanced color  
set size 1, 1.2
set terminal postscript portrait enhanced color dashed lw 1 "Helvetica" 14 
set output "../OrderParameterIONSnaclSCALING.eps"
set multiplot  layout 5,1
#set size 1.0, 1.6
set yrange [-0.12:0.1]
set xrange [-1:1050] 
set ytic 0.05
set key at screen 1.0,screen 1.07 maxcols 2 maxrows 4
#set key above

set ylabel "{/Symbol b}  S_{CH}"
plot "../../scratch/DPPCberger/NACLcons.dat" using 1:2 title 'DPPC, Berger, T=323K' with linespoint linetype 1 pt 5 lc rgb 'red', \
     "../../scratch/DPPCberger/NACLcons.dat" using 1:3 notitle with linespoint linetype 1 pt 5 lc rgb 'red', \
     "../../scratch/DPPCberger/NACLconsSCALED.dat" using 1:2 title 'DPPC, Berger Scaled, T=323K' with linespoint linetype 1 pt 5 lc rgb 'green', \
     "../../scratch/DPPCberger/NACLconsOPLS.dat" using 1:2 title 'DPPC, Berger-OPLS, T=323K' with linespoint linetype 1 pt 5 lc rgb 'blue', \
     "../../scratch/DPPCberger/NACLconsOPLSscaled.dat" using 1:2 title 'DPPC, Berger-OPLS scaled, T=323K' with linespoint linetype 1 pt 5 lc rgb 'yellow', \
     "../../Data/POPC/NaCl/EXP-Altenbach1984-T298K.dat"  using 1:($2*-0.00784) title 'POPC, ^2H NMR, T=298K' with linespoints  linetype 2 pt 5 lc rgb 'black', \
     "../../Data/POPC/NaCl/EXP-Altenbach1984-T313K.dat"  using 1:($2*-0.00784) title 'POPC, ^2H NMR, T=313K' with linespoints  linetype 2 pt 5 lc rgb 'black', \
     "../../Data/DPPC/NaCl/EXP-Akutsu1981.dat"  using 1:($2*-0.00784) title 'DPPC, ^2H NMR, T=323K' with linespoints  linetype 2 pt 7 lc rgb 'black'

set yrange [0:0.15]
set ylabel "{/Symbol a}  S_{CH}"
plot "../../scratch/BERGERnaclCONS.dat" using 1:4 notitle  with linespoint linetype 1 pt 5, \
     "../../scratch/BERGERnaclCONS.dat" using 1:5 notitle with linespoints  linetype 1 pt 5, \
     "../../scratch/MACROGnaclCONS.dat" using 1:4 notitle  with linespoint linetype 1 pt 5 lc rgb 'blue' , \
     "../../scratch/MACROGnaclCONS.dat" using 1:5 notitle with linespoints  linetype 1 pt 5 lc rgb 'blue', \
     "../../scratch/ORANGEnaclCONS.dat" using 1:4 notitle  with linespoint linetype 1 pt 5 lc rgb 'orange' , \
     "../../scratch/ORANGEnaclCONS.dat" using 1:5 notitle with linespoints  linetype 1 pt 5 lc rgb 'orange', \
     "../../scratch/CHARMMnaclCONS.dat" using 1:4 notitle  with linespoint linetype 1 pt 5 lc rgb 'green' , \
     "../../scratch/CHARMMnaclCONS.dat" using 1:5 notitle with linespoints  linetype 1 pt 5 lc rgb 'green', \
     "../../Data/POPC/NaCl/EXP-Altenbach1984-T298K.dat"  using 1:($3*0.00784) title 'POPC, ^2H NMR, T=298K' with linespoints  linetype 2 pt 5 lc rgb 'black', \
     "../../Data/POPC/NaCl/EXP-Altenbach1984-T313K.dat"  using 1:($3*0.00784) title 'POPC, ^2H NMR, T=313K' with linespoints  linetype 2 pt 5 lc rgb 'black', \
     "../../Data/DPPC/NaCl/EXP-Akutsu1981.dat"  using 1:($3*0.00784) title 'DPPC, ^2H NMR, T=323K' with linespoints  linetype 2 pt 7 lc rgb 'black'
 


set ylabel "g_{3}  S_{CH}"
set yrange [-0.3:-0.1]
plot "../../scratch/BERGERnaclCONS.dat" using 1:6 notitle with linespoint linetype 1 pt 5, \
     "../../scratch/BERGERnaclCONS.dat" using 1:7 notitle with linespoints  linetype 1 pt 5, \
     "../../scratch/MACROGnaclCONS.dat" using 1:6 notitle with linespoint linetype 1 pt 5 lc rgb 'blue', \
     "../../scratch/MACROGnaclCONS.dat" using 1:7 notitle with linespoints  linetype 1 pt 5 lc rgb 'blue', \
     "../../scratch/ORANGEnaclCONS.dat" using 1:6 notitle with linespoint linetype 1 pt 5 lc rgb 'orange', \
     "../../scratch/ORANGEnaclCONS.dat" using 1:7 notitle with linespoints  linetype 1 pt 5 lc rgb 'orange', \
     "../../scratch/CHARMMnaclCONS.dat" using 1:6 notitle with linespoint linetype 1 pt 5 lc rgb 'green', \
     "../../scratch/CHARMMnaclCONS.dat" using 1:7 notitle with linespoints  linetype 1 pt 5 lc rgb 'green'
#     "./g3ORDPnaCONSexpSIGN.dat"  using 1:2 notitle with linespoints  linetype 2 pt 7 lc rgb 'black'

set ylabel "g_{2}  S_{CH}"
set yrange [-0.25:-0.15]
plot "../../scratch/BERGERnaclCONS.dat" using 1:8 notitle with linespoint linetype 1 pt 5, \
     "../../scratch/MACROGnaclCONS.dat" using 1:8 notitle with linespoint linetype 1 pt 5 lc rgb 'blue', \
     "../../scratch/ORANGEnaclCONS.dat" using 1:8 notitle with linespoint linetype 1 pt 5 lc rgb 'orange', \
     "../../scratch/CHARMMnaclCONS.dat" using 1:8 notitle with linespoint linetype 1 pt 5 lc rgb 'green', \
     "../../scratch/g2ORDPnaCONSexpSIGN.dat"  using 1:2 notitle with linespoints  linetype 2 pt 7 lc rgb 'black'


set ylabel "g_{1}  S_{CH}"
set xlabel "[NaCl] (mM)"
set yrange [-0.2:0.2]
plot "../../scratch/BERGERnaclCONS.dat" using 1:9 notitle with linespoint linetype 1 pt 5, \
     "../../scratch/BERGERnaclCONS.dat" using 1:10 notitle with linespoints  linetype 1 pt 5, \
     "../../scratch/MACROGnaclCONS.dat" using 1:9 notitle with linespoint linetype 1 pt 5 lc rgb 'blue', \
     "../../scratch/MACROGnaclCONS.dat" using 1:10 notitle with linespoints  linetype 1 pt 5 lc rgb 'blue', \
     "../../scratch/ORANGEnaclCONS.dat" using 1:9 notitle with linespoint linetype 1 pt 5 lc rgb 'orange', \
     "../../scratch/ORANGEnaclCONS.dat" using 1:10 notitle with linespoints  linetype 1 pt 5 lc rgb 'orange', \
     "../../scratch/CHARMMnaclCONS.dat" using 1:9 notitle with linespoint linetype 1 pt 5 lc rgb 'green', \
     "../../scratch/CHARMMnaclCONS.dat" using 1:10 notitle with linespoints  linetype 1 pt 5 lc rgb 'green', \
     "../../scratch/g1ORDPnaCONSexpSIGN.dat"  using 1:2 notitle with linespoints  linetype 2 pt 7 lc rgb 'black',  \
     "../../scratch/g1ORDPnaCONSexpSIGN.dat"  using 1:3 notitle with linespoints  linetype 2 pt 7 lc rgb 'black'

unset multiplot

