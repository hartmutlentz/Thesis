set terminal epslatex color size 8.819 cm, 5.427 cm
# Sizes: 8.819 cm, 5.427 cm for 0.6 Thesis
#        14.6979 cm, 8.3988 cm for 1.0 Thesis
#        10.5 cm, 6 cm for another suitable

#set terminal aqua # activate pause at end of file!
set style line 1 lc rgb "#800000" lt 1 lw 2 # Cayenne
set style line 2 lc rgb "#666666" lt 1 lw 2 # Steel
set style line 3 lc rgb "#0a82cc" lt 1 lw 2 # light blue (Triade)
set style line 4 lc rgb "#b34112" lt 1 lw 2 # Orange (Compound)

set style increment user


set output "sir_model_gnu.tex"
# in main.tex
# \begin {figure} 
#  \begin{center} 
#   \input{plot}
#  \end{center} 
# \end {figure}
#

#set encoding iso_8859_1 # fuer Umlaute

#set term aqua 0

set key spacing 1.3  # Buchstabenabstand

set style data lines # w l
set xrange[0:10]
#set yrange[0:*]
#set xzeroaxis
#set yzeroaxis
#set log
#set logscale y 
#set log

#set arrow from 0.086,0.656659 to  0.086,0.0 lt 3 lw 2 nohead

#set lmargin 14.1 # Abstand links zu Papierrand
#set bmargin 4  # Abstand unten zu Papierrand

set key at graph 1.0, graph 0.6  # keine Legende
#set title 'Range Gap in an ER DiGraph'
# set label 'ghj'

set xlabel "time $t$"# font "Times-roman,24"
#set xtics 0.002

#set label 1 "mean, variance" font "Times-roman,24" at graph -0.15, graph 0.5  
# fuer horizontales ylabel

set ylabel "Population"# font "Times-roman,24"
# {/Symbol W} fuer griechisch
#set y2label "Balance"
#set y2tics 0.2
set ytics 100
############################################################

############################################################
p "sir_single.txt" u 1:2 title 'Susceptible' ls 1,\
 'sir_single.txt' u 1:3 title 'Infected' ls 2,\
 'sir_single.txt' u 1:4 title 'Recovered' ls 3

set output
#pause -1 "Hit return to continue"
reset