#!/bin/bash

g++ -std=gnu++0x -fopenmp -o1 datagen.cpp -o datagen

./datagen 1000  # 200 m data points

echo "data generated"

g++ -o1 vp_tree_const_saved_queries.cpp -o vp_tree_const_saved_queries

./vp_tree_const_saved_queries

echo "queries done"

g++ -std=gnu++0x -o1 -fopenmp query_datagen.cpp -o query_datagen

echo "Starting computations"

./query_datagen 100

g++ -o1 -fopenmp knn.cpp -o knn

./knn 1 > ../data/queries/k_1_path_length.txt 
./knn 10 > ../data/queries/k_10_path_length.txt 



g++ -std=gnu++0x -fopenmp -o1 datagen.cpp -o datagen

./datagen 2000  # 200 m data points

echo "data generated"

g++ -o1 vp_tree_const_saved_queries.cpp -o vp_tree_const_saved_queries

./vp_tree_const_saved_queries

echo "queries done"

g++ -std=gnu++0x -o1 -fopenmp query_datagen.cpp -o query_datagen

echo "Starting computations"

./query_datagen 200

g++ -o1 -fopenmp knn.cpp -o knn

./knn 1 >> ../data/queries/k_1_path_length.txt 
./knn 10 >> ../data/queries/k_10_path_length.txt 


: '
echo "starting 80m queries"

./knn 1 > ../data/queries/k_1_path_length.txt 
./knn 10 > ../data/queries/k_10_path_length.txt 

echo "done queries for 80m"

./query_datagen 100000000

./knn 1 >> ../data/queries/k_1_queries.txt 
./knn 10 >> ../data/queries/k_10_queries.txt 

echo "done queries for 100m"

./query_datagen 200000000

./knn 1 >> ../data/queries/k_1_queries.txt
./knn 10 >> ../data/queries/k_10_queries.txt 

echo "done queries for 200m"
./query_datagen 400000000

./knn 1 >> ../data/queries/k_1_queries.txt
./knn 10 >> ../data/queries/k_10_queries.txt 

echo "done queries for 400m"

./query_datagen 800000000

./knn 1 >> ../data/queries/k_1_queries.txt
./knn 10 >> ../data/queries/k_10_queries.txt 
echo "done queries for 800m"

echo "done all"

'
echo "done with all" 