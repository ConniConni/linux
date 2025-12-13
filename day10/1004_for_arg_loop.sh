#!/bin/bash

# 引数をループする
echo "引数をループします"

count=0

for user in "${@}"
do
	echo "${count}: ${user}"
        (( count++ ))
done
