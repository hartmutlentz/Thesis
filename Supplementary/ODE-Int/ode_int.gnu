set terminal epslatex color size 14.6979 cm, 8.3988 cm
#set terminal x11 # activate pause at end of file!

set output "sir_model.tex"
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

set key at graph 0.7, graph 0.5  # keine Legende
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
#set ytics 200
############################################################

############################################################
p "sir_single.txt" u 1:2 title 'Susceptible' lw 3 lt 3,\
 'sir_single.txt' u 1:3 title 'Infected' lw 3 lt 1,\
 'sir_single.txt' u 1:4 title 'Recovered' lw 3 lt 2

set output
#pause -1 "Hit return to continue"
reset