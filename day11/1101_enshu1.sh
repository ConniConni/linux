#!/bin/bash

# ファイルの値を読み込む
# file=$(cat file.txt)
# sum=0
# while read p
# do
#	(( sum + p ))	
# done < file.txt
# 読み込んだ値をforループで足し算
# .sh 2> /dev/null で実行 

file=file.txt
sum=0


if [[ ! -f "${file}" ]];then
	echo "${file}がありません"
	exit 1
fi

while read p
do
	(( sum += "${p}" )) 2> /dev/null
done < "${file}"
echo "${sum}"
