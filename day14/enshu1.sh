#!/bin/bash

#file=$(cat input.csv)
all_total=0
# 1. UTCのUNIX時刻を取得
unix_today=$(date +'%s') 
# 2. YYYYMMDD に変換
#jst_ymd_today=$(date '+%Y%m%d' --date "@$unix_today")
#上記はlinuxならOK 今回はmacOSのため以下で代用
jst_ymd_today=$(date -r "$unix_today" '+%Y%m%d')
#echo "${file}"


#$5を足すループ
while IFS=',' read -r col1 col2 col3 col4 col5
do
#	echo "${p}"
	(( all_total += col5 ))
done < input.csv
echo "ファイル内の全期間の売上・費用の合計値: ${all_total}" > output_${jst_ymd_today}.csv


# $1ごとに$5を足すループ
# 表示は 19010101: 〇〇円 とする
declare -A daily_sales_total
while IFS=',' read -r col1 col2 col3 col4 col5
do
        (( daily_sales_total[col1] += col5 ))
done < input.csv

for date_key in "${!daily_sales_total[@]}";
do
	echo "${date_key}: ${daily_sales_total[${date_key}]}円"
done | sort >> output_${jst_ymd_today}.csv
# $3ごとに$5をたすループ

declare -A item_sales_total
while IFS=',' read -r col1 col2 col3 col4 col5
do
	(( item_sales_total[col3] += col5 ))
done < input.scv

for item_key in "${!item_sales_total[@]}";
do
	echo "${item_key}: ${item_sales_tota[${item_key}]"
done | sort >> output_${jst_ymd_today}.csv 
