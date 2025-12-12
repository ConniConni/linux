#!/bin/bash

export locky_color="red"
export locky_color2="blue"

# 変数が設定されていない場合

if [[ -z "$locky_color" ]]; then
	echo "色を設定してください"
	exit 1
fi


echo "ラッキーカラーは${locky_color}です"

# 変数が設定されていない場合その２

if [[ "${locky_color2}" == "" ]]; then
	echo "locky_color2が設定されていません"
	exit 1
fi

echo "ラッキーカラーは${locky_color2}です"

if [[ -n "${locky_color}" ]]; then
	echo "ラッキーからは${locky_color}です"
fi


# 環境変数を削除
#unset locky_color
