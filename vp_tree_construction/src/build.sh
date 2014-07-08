#!/bin/bash

g++ -std=gnu++0x datagen.cpp -o datagen

./datagen 80000000

echo "80m done"

g++ -o1 vp_tree_const.cpp -o vp_tree_const

./vp_tree_const 

./datagen 100000000

./vp_tree_const 


echo "100m done"
./datagen 200000000

./vp_tree_const 

echo "200m done"

./datagen 400000000

./vp_tree_const 
echo "400m done"
./datagen 800000000

./vp_tree_const 
echo "800m done"
./datagen 1200000000

./vp_tree_const 

echo "1.2b done"
