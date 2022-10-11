#!/bin/bash

exec < $1

cols=$(( $(head -n 1 $1 | grep -o ',' | grep -c .) + 1))
rows=$(wc -l $1 | cut -d " " -f 1)

echo "Header: $(head -n 1 $1 | tr , " ")"
echo "$cols cols x $rows rows"
echo
echo "Sum of columns:"

echo $(head -n 1 $1 | tr , " ")
for ((i=1; i<=$cols; i++))
do
    sum=0
    for ((r=1; r<=$rows; r++))
    do
        num=$(tail -n+$(($r+1)) $1| head -n1 | cut -d "," -f $i)
        if [ "$num" != " " ] && [ "$num" != "" ]
        then
            sum=$(($sum+$num)) 
        fi
    done
    echo -n "$sum "
done
echo
