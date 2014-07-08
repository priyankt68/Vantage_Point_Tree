#!/bin/bash

k_1=( $(cut -d ',' -f2 k_1_path_length.txt ) )

max=0
for n in "${k_1[@]}" ; do
    ((n > max)) && max=$n
done
echo $max

