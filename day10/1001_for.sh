#!/bin/bash

# for文で一単語ずつ表示
names="Taro Jiro saburo"
count=0

for name in ${names}
do
	echo "${name}"
        echo $(( count++ ))
done
