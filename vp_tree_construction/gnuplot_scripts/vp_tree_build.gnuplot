set title "Sequential VP Tree Build  "
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
plot "../data/build/vp_tree_build_timings.txt" using 1:2 ti ""
set terminal png 
set output "../images/vp_tree_build.png"
replot
pause -1
