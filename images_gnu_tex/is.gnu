set terminal epslatex color size 14.6979 cm, 8.3988 cm
#set terminal x11 # activate pause at end of file!

set output "is.tex"
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
#set xrange[1:1000]
#set yrange[0:*]
#set xzeroaxis
#set yzeroaxis
#set log
#set logscale y 
#set log

#set arrow from 0.086,0.656659 to  0.086,0.0 lt 3 lw 2 nohead

set lmargin 14.1 # Abstand links zu Papierrand
set bmargin 4  # Abstand unten zu Papierrand

#unset key   # keine Legende
set title 'Range Gap in an ER DiGraph'
# set label 'ghj'

set xlabel "$p_\\mathrm{rev}$"# font "Times-roman,24"
set xtics 0.002

#set label 1 "mean, variance" font "Times-roman,24" at graph -0.15, graph 0.5  
# fuer horizontales ylabel

set ylabel "Range gap $\\Gamma $"# font "Times-roman,24"
# {/Symbol W} fuer griechisch
set y2label "Balance"
set y2tics 0.2
set ytics 200
############################################################
a=1.2
f(x)=x**(-a)*10000
############################################################
# plot f(x)
p "RangeGaps.txt" u 1:2 title 'Range-Gaps', 'RangeGaps.txt' u 1:3 title 'Balance' axes x1y2

set output
#pause -1 "Hit return to continue"
reset