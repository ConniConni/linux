#!/bin/bash

# for文で一単語ずつ表示
names="Taro Jiro saburo"
count=0

for name in ${names}
do
	echo "${name}"
        echo $(( count++ ))
done

# for文で5回繰り返す
echo "for文で5回繰り返す"
for i in {1..5}
do
	echo "${i}"
done

# for文で偶数を0から10まで表示
echo "for文で偶数を0から10まで表示"
for even_num in {0..10..2}
do
	echo "${even_num}"
done

# for文で正の奇数を11から表示
echo "for文で正の奇数を11から表示"

for odd_num in {11..0..2}
do
	echo "${odd_num}"
done

# for文で正の奇数を11から表示
echo "for文で正の奇数を11から表示"

for odd_num in  $( seq 11 -2 0)
do
        echo "${odd_num}"
done

# 連想配列のキーをforループで取り出す
echo "連想配列のキーをforループで取り出す"

declare -A salaries
salaries["Taro"]=1000000
salaries["jiro"]=500000
salaries["sayo"]=250000

for i in "${!salaries[@]}"
do
	echo "${i}: ${salaies[${i}]}"
done


