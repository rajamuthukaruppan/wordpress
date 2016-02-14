#!/bin/bash

ARR=()
IFS='/'; 

for word in $1; do 
 ARR+=("$word");
done

NAME=${ARR[${#ARR[@]}-1]}
DAY=${ARR[${#ARR[@]}-2]}
MONTH=${ARR[${#ARR[@]}-3]}
YEAR=${ARR[${#ARR[@]}-4]}

echo $YEAR$MONTH$DAY $NAME

./migratePage.sh $YEAR$MONTH$DAY $NAME

