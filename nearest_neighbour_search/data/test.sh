#!/bin/bash

eCollection=( $(cut -d ',' -f2 build_timing.txt ) )
printf "%s\n" "${eCollection[0]}"

