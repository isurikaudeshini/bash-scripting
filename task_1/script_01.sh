#!/bin/bash
#
#
echo -e "This script prints the 6th & 10th column of a given CSV.\n"

COLUMN_COUNT=$(awk -F ',' '{print NF; exit}' trade.csv)

if [ $COLUMN_COUNT < 10 ]
    then
        awk -F ',' '{OFS=",";print $6 $10}' 
    else
        echo "File does not contain 10 columns!"
fi  < trade.csv 



