#!/bin/bash

# ディレクトリ名、ファイル名を定義
INPUT_FILE="input.csv"
INPUT_DIR="input"
OUTPUT_DIR="output"
OUTPUT_FILE="output"

# 現在日付をyyyymmdd形式で取得
day=$(date '+%Y%m%d')

# 合計の費用、売上
total_costs=0
total_sales=0
costs_by_day=0
sales_by_day=0

# realpathを使ってカレントのフルパスを取得
current_path=$(realpath ${0})

# dirnameを使ってカレントのディレクトリパスを取得
dir_name=$(dirname ${current_path})

# inputファイルのパスを取得
input_file="${dir_name}/${INPUT_DIR}/${INPUT_FILE}"

# outputファイルのパスを取得
output_file="${dir_name}/${OUTPUT_DIR}/${OUTPUT_FILE}_${day}.csv"

# 全期間の売上、費用それぞれの合計
echo "--- 合計 ---" > "${output_file}"
awk -F "," '$2=="費用" {total_costs+=$5} END{print "費用: " total_costs}' "${input_file}" >> "${output_file}"
awk -F "," '$2=="売上" {total_sales+=$5} END{print "売上: " total_sales}' "${input_file}" >> "${output_file}"

# 日付ごとの売上、費用の合計
echo -e "\n--- 日付ごとの合計 ---" >> "${output_file}"

awk -F "," '
    $2=="費用" { hiyo[$1] += $5 }
    $2=="売上" { uriage[$1] += $5 }
    END {
        for (i in hiyo) {
            costs_by_day+=hiyo[i]
            sales_by_day+=uriage[i]
            print i, "費用合計:", hiyo[i], "売上合計:", uriage[i]
        }
	print "費用総合計: ", costs_by_day, "売上総合計: ", sales_by_day
    }
' "${input_file}" >> "${output_file}"
