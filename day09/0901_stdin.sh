#!/bin/bash

# 標準入力
read name

echo ${name}

# 入力を促すメッセージを表示
read -p "メッセージをを入力してください: " message

echo ${message}

# 入力値を非表示にする
read -sp "パスワードを入力してください: " password
echo ${password}

# 配列
read -a sports
echo ${sports[@]}
