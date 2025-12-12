#!/bin/bash

read -p "年齢を入力してください："  age

#if [[ ${age} -ge 60 ]];
#then
#  echo "あなたは60以上ですね"
#elif [[ ${age} -gt 20 ]];
#then
#  echo "あなたは21~59ですね"
#else
#  echo "あなたは20以下ですね"
#fi

if (( ${age} >= 60 ));
then
  echo "あなたは60以上ですね"
elif (( ${age} > 20 ));
then
  echo "あなたは21~59ですね"
else
  echo "あなたは20以下ですね"
fi
