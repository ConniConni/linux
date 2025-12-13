#!/bin/bash

# 0 〜 100
# 15で割り切れたらFB
# 15で割り切れないが、３で割り切れるF
# 15で割り切れないが、5で割り切れるB

# 課題整理

# for ループ
# 条件1 15の倍数の時FBと表示
# 条件2 15の倍数でないかつ3の倍数の時Fと表示
# 条件3 15の倍数でないかつ5の倍数の時Bと表示
# 捕捉1 0は割り切れない数字とする

for num in {0..100}
do
	if (( ${num}==0 ));then
		echo "${num}: "
		continue

	elif (( ${num}%15==0 ));then
		echo "${num}: FB"
		continue

	elif (( ${num}%3==0 ));then
		echo "${num}: F"
		continue

        elif (( ${num}%5==0 ));then
		echo "${num}: B"
		continue
        else
		echo "${num}:  "
	fi
	
	#echo "${num}:  "
done
