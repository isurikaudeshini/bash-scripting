#!/bin/bash
#
#
echo -e "This script prints the 6th & 10th column of a 10 column CSV.\n"

csv_file=trade.csv

COLUMN_COUNT=$(awk -F ',' '{print NF; exit}' $csv_file)

if [ "$COLUMN_COUNT" -eq 10 ]; then
        awk -F ',' '{OFS=","; print $6, $10}'  $csv_file
    else
        echo "File does not contain 10 columns!"
fi  


