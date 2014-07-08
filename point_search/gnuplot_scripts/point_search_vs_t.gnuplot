set title "Point Searches  "
set ylabel "Time (sec)"
set xlabel "No. of data points (N)"

set datafile missing "-"
set xtics nomirror rotate by -65 font ",8"
#set auto x
#set linestyle 1 lt 2 lw 3
#set key box linestyle 1
set key box left top
#
# First plot using linepoints

set style data linespoints
set datafile separator " "
plot "../data/point_search_timings.txt" using 1:2 ti ""
set terminal png 
set output "../images/point_search_vs_t.png"
replot
pause -1
