set title "k-NN VP Tree Search   \n No. of Data Points(N) = 200M,  No. of Query points(Q) = 100M"
set ylabel "Time (sec)"
set xlabel "Number of nearest-neighbour (k)"
#set xrange [ 1 : 8 ]
#set yrange [ 0 : 5 ]
set datafile missing "-"
#set xtics nomirror rotate by -65 font ",8"
set auto x
#set linestyle 1 lt 2 lw 3
#set key box linestyle 1
set key box left top
#
# First plot using linepoints
set style data linespoints
set datafile separator " "
plot "../data/queries/variable_k_nearest_neighbor_search_timings.txt" using 1:2 ti "N = 200M, Q = 100M"
set terminal png 
set output "../images/variable_k_vs_t.png"
replot
pause -1

