<<<<<<< HEAD
VP Tree
=======


Introduction
------------
The VP tree is particularly useful in dividing data in a [non-standard metric space](https://en.wikipedia.org/wiki/Metric_space#Examples_of_metric_spaces) into a
[BSP tree](https://en.wikipedia.org/wiki/Binary_space_partitioning).
Tree construction executes in O(n&nbsp;log(n)) time, and search is under certain circumstances and in the limit, O(log(n))
expected time. This makes it suitable when distance computations are expensive.

Construction
------------

It is most efficient to simply build the tree by repeatedly partitioning the data. We build the tree from the top down from an array of items. For each node, we first choose a point at random, and then partition the list into two sets: The left children contain the points farther away than the median, and the right contains the points that are closer than the median. Then we recursively repeat this until we have run out of points. 

Directory Structure
-------------------

Following is the directory structure for the Vantage Point Tree Code-base

.
├─Sequential Vantage Point Tree
├── nearest_neighbour_search (K-NN)
│   ├── data
│   │   ├── build_timing.txt (time for build process of vp tree)
│   │   ├── data.txt (data for vp-tree construction)
│   │   ├── queries
│   │   │   ├── k_10_queries.txt (time taken for k-nn, k =10)
│   │   │   ├── k_1_queries.txt (time taken for k-nn, k =1)
│   │   │   ├── variable_k_nearest_neighbor_search_timings.txt (time taken for k-nn, k =1, 2, 4, 8, 16, 32)
│   │   ├── query.txt (data for query set on constructed vp tree)
│   │   ├── variable_k  (Following directory constains the path length taken for every value of k.)
│   │   │   ├── k_0_path_length.txt
│   │   │   ├── k_16_path_length.txt
│   │   │   ├── k_1_path_length.txt
│   │   │   ├── k_2_path_length.txt
│   │   │   ├── k_32_path_length.txt
│   │   │   ├── k_4_path_length.txt
│   │   │   ├── k_8_path_length.txt
│   │   └── vp_tree_build.txt (File contains the values of the vp tree constructed. [x, y, r])
│   ├── gnuplot_scripts
│   │   ├── histogram_path_length.gnuplot
│   │   ├── k_nn_10_vs_t.gnuplot
│   │   ├── k_nn_1_vs_t.gnuplot
│   │   ├── variable_k_vs_t.gnuplot
│   ├── images
│   │   ├── histogram_k_16.png
│   │   ├── histogram_k_1.png
│   │   ├── histogram_k_2.png
│   │   ├── histogram_k_32.png
│   │   ├── histogram_k_4.png
│   │   ├── histogram_k_8.png
│   │   ├── k_nn_10_vs_t.png
│   │   ├── k_nn_1_vs_t.png
│   │   └── variable_k_vs_t.png
│   └── src
│       ├── datagen.cpp
│       ├── knn.cpp
│       ├── nearest_neighbour_performance_script.sh
│       ├── queries.sh (Performance Script for k-nn, k=1, 10)
│       ├── query_datagen.cpp
│       ├── variable_k_nn.cpp
│       ├── variable_k.sh ((Performance Script for k-nn, k=1, 2,4 8, 16, 32))
│       ├── vp_tree_const_saved_queries.cpp
├── pointer_based_vp_tree (Pointer based vp-tree construction)
│   ├── pointer_vp_tree_const.cpp
│   └── vptree.h
├── point_search
│   ├── data
│   │   ├── point_search_timings.txt
│   │   ├── vp_tree_build_for_point_search_100k.txt
│   │   ├── vp_tree_build_for_point_search_100m.txt
│   │   ├── vp_tree_build_for_point_search_10k.txt
│   │   ├── vp_tree_build_for_point_search_10m.txt
│   │   ├── vp_tree_build_for_point_search_1b.txt
│   │   ├── vp_tree_build_for_point_search_1m.txt
│   │   ├── vp_tree_build_for_point_search_20m.txt
│   │   ├── vp_tree_build_for_point_search_40m.txt
│   │   ├── vp_tree_build_for_point_search_500k.txt
│   │   ├── vp_tree_build_for_point_search_80k.txt
│   │   └── vp_tree_build_for_point_search_80m.txt
│   ├── datagen.cpp~
│   ├── gnuplot_scripts
│   │   ├── histogram_plot_pathlength_point_searches.gnuplot
│   │   └── point_search_vs_t.gnuplot
│   ├── images
│   │   ├── histogram_100k.png
│   │   ├── histogram_100m.png
│   │   ├── histogram_10k.png
│   │   ├── histogram_10m.png
│   │   ├── histogram_1m.png
│   │   ├── histogram_20m.png
│   │   ├── histogram_40m.png
│   │   ├── histogram_500k.png
│   │   ├── histogram_80k.png
│   │   ├── histogram_80m.png
│   │   └── point_search_vs_t.png
│   ├── src
│   │   ├── datagen.cpp
│   │   ├── point_searches.cpp
│   │   ├── point_search_performance_script.sh
│   │   ├── query_datagen_point_searches.cpp
│   │   ├── traversal_path.sh
│   │   └── vp_tree_const_saved_queries.cpp
│   ├── traversal_path.sh~
├── README.md
├── Results_Report.odt
└── vp_tree_construction
    ├── data
    │   ├── build
    │   ├── data.txt
    │   └── vp_tree_build_timings.txt
    ├── gnuplot_scripts
    │   ├── vp_tree_build.gnuplot
    ├── images
    │   └── vp_tree_build.png
    └── src
        ├── build.sh
        ├── datagen.cpp
        ├── vp_tree_check.cpp
        ├── vp_tree_const.cpp


=======
Vantage_Point_Tree
==================
>>>>>>> c59284b0188d36bd69327dd260e284b2cb76ad74
