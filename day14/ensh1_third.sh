#!/bin/bash

INPUT_DIR="input"
OUTPUT_DIR="output"
INPUT_FILE="input.csv"

# input.csvのパスを取得
current_path=$(realpath ${0})
dir_path=$(dirname ${current_path})
file_path=${dir_path}/${INPUT_DIR}/${INPUT_FILE}

# ファイルないの全期間の売上・費用の合計値を格納する変数
sum_all_sales=0
sum_all_costs=0

# 日付ごとの売上・費用を管理する配列
declare -A daily_sales
declare -A daily_costs

# アイテムごとの売上・費用を管理する配列
declare -A sales_by_item
declare -A costs_by_item

# ファイルないの全期間の売上・費用の合計値を表示
while read p
do
    day=$(echo "${p}" | cut -d "," -f 1)
    sale_or_cost=$(echo "${p}" | cut -d "," -f 2)
    item=$(echo "${p}" | cut -d "," -f 3)
    value=$(echo "${p}" | cut -d "," -f 5)

    if [[ "${sale_or_cost}" == "売上" ]];then
        (( sum_all_sales+=value ))
        (( daily_sales["${day}"]+="${value}" ))
        # (( sales_by_item["${item}"]+="${value}" ))
    elif [[ "${sale_or_cost}" == "費用" ]];then
        (( sum_all_costs+=value ))
        (( daily_costs["${day}"]+="${value}" ))
        # (( costs_by_item["${item}"]+="${value}" ))
    fi
done < ${file_path}

echo "--- 全期間の売上・費用の合計値 ---"
echo "売上: ${sum_all_sales}円"
echo "費用: ${sum_all_costs}円"

echo -e "\n--- 日付ごとの売上合計値 ---"
echo "日付,売上,費用"
echo "${!daily_sales[@]}" | sed 's/ /\n/g' | sort -n | while read key
do
    echo "${key},${daily_sales[${key}]},${daily_costs[${key}]}"
done

echo -e "\n--- 品目ごとの売上・費用の合計値 ---"
echo "品物,売上,費用"
echo "${!sales_by_item[@]}" "${!sales_by_item[@]}" | sed 's/ /\n/g' | sort | uniq | while read key
do
    echo "${key},${sales_by_item[${key}]},${costs_by_item[${key}]}"
done
