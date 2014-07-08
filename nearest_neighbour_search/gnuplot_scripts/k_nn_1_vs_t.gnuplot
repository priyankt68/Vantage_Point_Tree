set title "k-NN VP Tree Search   \n \n No. of Data Points(N) = 200M,  No. of nearest-neighbour(k) = 1"
set ylabel "Time (sec)"
set xlabel "Query size (Q)"
#set xrange [ 1 : 8 ]
#set yrange [ 0 : 5 ]
set datafile missing "-"
set xtics nomirror rotate by -65 font ",8"
set auto x
#set linestyle 1 lt 2 lw 3
#set key box linestyle 1
set key box left top
#
# First plot using linepoints

set style data linespoints
set datafile separator " "
plot "../data/queries/k_1_queries.txt" using 1:2 ti "N = 200M, k = 1"
set terminal png 
set output "../images/k_nn_1_vs_t.png"
replot
pause -1
