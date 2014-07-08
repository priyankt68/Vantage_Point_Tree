
echo "starting computations, tree size : 200m, queries size : 100m, varying k=1-32"

g++ -std=gnu++0x -fopenmp -o1 datagen.cpp -o datagen

./datagen 200000000  # 200 m data points

echo "data generated"

g++ -o1 vp_tree_const_saved_queries.cpp -o vp_tree_const_saved_queries

./vp_tree_const_saved_queries

g++ -std=gnu++0x -o1 -fopenmp query_datagen.cpp -o query_datagen

echo "Starting computations"

./query_datagen 100000000

g++ -o1 -fopenmp variable_k_nn.cpp -o variable_k_nn

./variable_k_nn 1 > ../data/variable_k/k_1_path_length.txt

echo "done for 1"

./variable_k_nn 2 >> ../data/variable_k/k_2_path_length.txt

echo "done for 2"

./variable_k_nn 4 >> ../data/variable_k/k_4_path_length.txt

echo "done for 4"

./variable_k_nn 8 >> ../data/variable_k/k_8_path_length.txt

echo "done for 8"

./variable_k_nn 16 >> ../data/variable_k/k_16_path_length.txt

echo "done for 16"

./variable_k_nn 32 >> ../data/variable_k/k_32_path_length.txt

echo "done for 32"

echo "done, path length save in vp_tree/data/variable_k/k_x_path_length.txt , timings ../data/queries/k_nearest_neighbor_search_timings.txt"
