#!/bin/bash

count=1
while [ $count -le 5 ]
do
    echo "Count: $count"
    count=$((count+1))
done

for number in {1..5}
do
    echo "Number: $number"
done

fruits=("apple" "banana" "cherry" "date")
for fruit in "${fruits[@]}"
do
    echo "I like $fruit"
done
