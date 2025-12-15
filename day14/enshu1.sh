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

while IFS=',' read -r col1 col2 col3 col4 col5
do
#	echo "${p}"
	(( all_total += col5 ))
done < input.csv
echo "ファイル内の全期間の売上・費用の合計値: ${all_total}" > output_${jst_ymd_today}.csv

#$5を足すループ


# >> input.csv

# $1ごとに$5を足すループ

# $3ごとに$5をたすループ
