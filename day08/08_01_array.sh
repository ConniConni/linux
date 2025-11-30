!#/bin/bash

months=("January" "February" "March")

# 全要素アクセス
echo "全要素アクセス"
echo "${months[@]}"

# 指定なしは0番目の要素が表示される
echo "指定なし"
echo "${months}"

# 各要素にアクセス
echo "各要素にアクセス"
var="1月 ${months[0]}, 2月 ${months[1]}, 3月 ${months[2]}"
echo "${var}"

# 要素の追加
echo "要素の追加"
months+=("April" "May")
echo ${months[@]}

# 要素の追加２
echo "要素の追加２"
months=(${months[@]} "June")
echo ${months[@]}

# 要素の削除
echo "要素の削除"
unset months[0]
echo ${months[@]}

# 要素の変更
echo "要素の変更"
months[0]="2月"
echo ${months[@]}

# 配列の長さを取得 配列前に # をつけると長さを取得できる
echo "配列の長さを取得"
echo ${#months[@]}
echo "1番目の要素の長さを取得"
echo ${#months[1]}