#!/bin/bash

number=12

if ((number+20 == 32));then
  echo "number + 20 = 32"
fi

num=20

((num++))
echo "${num}"
