#!/bin/bash

number=12

if ((number+20 == 32));then
  echo "number + 20 = 32"
fi

num=20

((num++))
echo "num=${num}"

# 否定1
if [[ ! ${num} -gt 23 ]]; then
  echo "numは23より大きくありません"
fi

# 否定2
if !(( ${num} > 23 )); then
  echo "numは23より大きくありません"
fi

# OR(論理和)1
if [[ ${num} > 0 || ${num} < 0 ]]; then
  echo "${num}は0ではありません"
fi

# OR(論理和)2
if ((${num} > 0 || ${num} < 0)); then
  echo "${num}は0ではありません"
fi

# AND(論理積)1
if [[ ${num}>0 && ${num}%2=1 ]]; then
  echo "${num}は正の奇数です"
fi

((num++))
# AND(論理積)2
if (( ${num}>0 && ${num}%2==0 )); then
  echo "${num}は正の偶数です"
fi
