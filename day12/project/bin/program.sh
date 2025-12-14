#!/bin/bash

# 2階層上のproject配下のdataディレクトリ配下のname.csvから名簿を読み取り出力する

CSV_NAME_DIR="data"
CSV_NAME="name.csv"

full_path=$(realpath "${0}")
echo "デバック: full_path=${full_path}"

bin_path=$(dirname "${full_path}")
echo "デバック: bin_path=${bin_path}"

project_path=$(dirname "${bin_path}")
echo "デバック: project_path=${project_path}"

file_path="${project_path}/${CSV_NAME_DIR}/${CSV_NAME}"

file=$(cat "${file_path}")
echo "${file}"
