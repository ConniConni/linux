#!/bin/bash

# 要件整理
# 1. ランダムな値を生成する
#	覚えていない random
#       $RANDOM
#    random_num=$(( RANDOM % 101 ))
# 2. ユーザーに数値の入力を促す
# 	read -p "半角で正の整数を入力してください" input_num
# 2. 入力値が半角の正の整数でない場合は数字を入力するように促す
#    
#    正規表現: ^...$で文字列全体がパターン(...)に一致することを確認
#    -?: マイナス記号が1回出現
#    [0-9]+: 0から9の数字が1回以上出現
#    
#    if [[ ! "${input_num}"=~^[0-9]+$ ]];then echo "半角の正の整数を入力してください" fi
#    
# 3. 2の数字が1の数字より大きい場合、「もう少し小さい値です」と表示
#
#    if (( ${input_num}>${random_num} ));then echo "もう少し小さい値です" 
#
# 3. 2の数字が1の数字より小さい場合、「もう少し大きい値です」と表示
#
#    elif (( ${input_num}<${random_num} )) echo "もう少し小さい値です" fi
# 4. 数字を当てたらループの外にでる。
#    (( count++ ))
#
#    while (( ${input_num}==${random_num} ));
# 4. その些細、「正解は〇〇です。まるまるかいで正解を当てました」と
#    答えと正解までに回答した回数を表示
#     echo "正解は${random_num}です。${count}回で正解を当てました"

count=0
random_num=$(( ${RANDOM} % 101 ))

while true;
do
	(( count++ ))
	read -p "半角で正の整数を入力してください: " input_num
	
	if [[ ! "${input_num}" =~ ^[0-9]+$ ]];then
		echo "エラー：半角の正の整数ではありません"
		continue	
	
	elif (( ${input_num}>${random_num} ));then
		echo "もう少し小さい値です"
		continue
	
	elif (( ${input_num}<${random_num} ));then
                echo "もう少し大きい値です"
                continue
        fi
	break
done


echo "正解は${random_num}です。${count}回で正解を当てました"
