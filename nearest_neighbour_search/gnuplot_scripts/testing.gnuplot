

reset
set title "Distribution of Path Length   \n No. of Data Points(N) = 200M,  No. of Query points(Q) = 100M, k = 8"
n=183 #number of intervals
max=183. #max value
min=0. #min value
width=(max-min)/n #interval width
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set term png #output terminal and file
set output "../images/histogram_k_tst.png"
set xrange [min:max]
set yrange [0:]
#to put an empty boundary around the
#data inside an autoscaled graph.
set offset graph 0.05,0.05,0.05,0.0
set xtics auto
set boxwidth width*0.9
set style fill solid 0.5 #fillstyle
set tics out nomirror
set xlabel "Path Length"
set ylabel "Frequency"
#count and plot
plot "../data/variable_k/k_x_path_length.txt" u (hist($1,width)):(1.0) smooth freq w boxes lc rgb"green" ti ""

