#!/bin/bash

# continueで処理を飛ばす
echo " continueで処理を飛ばす"

for num in {0..10}
do
	#if [[ "${num}" -eq 5 ]];then
	if (( "${num}"==5 ));then
		continue
	fi
	echo "${num}"
done
