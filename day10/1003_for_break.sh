#!/bin/bash

# breakでループを終了する
echo " breakでループを終了する"

for num in {0..9}
do
	if [[ "${num}" -eq 3 ]];then
		echo "3になったのでループを終了します"
		break
	fi

	echo "${num}"
done
