#!/bin/bash

g++ -std=gnu++0x -fopenmp datagen.cpp -o datagen

./datagen 200000000  # 200 m data points

echo "data generated"
g++ -o2 vp_tree_const_saved_queries.cpp -o vp_tree_const_saved_queries

./vp_tree_const_saved_queries

echo "queries done"

g++ -std=gnu++0x -o2 -fopenmp query_datagen.cpp -o query_datagen


echo "Starting computations"

./query_datagen 80000000

g++ -o2 knn.cpp -o knn

echo "starting 80m queries"

./knn 1 > ../data/queries/k_1_queries.txt 
./knn 10 > ../data/queries/k_10_queries.txt 

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

