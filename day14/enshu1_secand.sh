#!/bin/bash

# ディレクトリ名、ファイル名を定義
INPUT_FILE="input.csv"
INPUT_DIR="input"
OUTPUT_DIR="output"

# 合計の費用、売上
total_earning=0

# realpathを使ってカレントのフルパスを取得
current_path=$(realpath ${0})

# dirnameを使ってカレントのディレクトリパスを取得
dir_name=$(dirname ${current_path})

# inputファイルのパスを取得
input_file_path="${current_path}/${INPUT_DIR}/${INPUT_FILE}"

# 全期間の売上、費用それぞれの合計
while read p
do
	cost_or_earning=$(echo "${p}" | cut -d "," -f 2)
	price=$(echo "${p}" | cut -d "," -f 5)
	if [[ "${cost_or_earning}" == "売上" ]];then
        (( total_earning+=price ))
	fi
done < "${INPUT_FILE}"
echo "${total_earning}"
