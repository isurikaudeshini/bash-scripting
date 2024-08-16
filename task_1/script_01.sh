#!/bin/bash
#
#
echo -e "This script prints the 6th & 10th column of a 10 column CSV.\n"



# Check if number of columns are greater than or equal 10 & print 6th & 10th column

print_columns() {

COLUMN_COUNT=$(awk -F ',' '{print NF; exit}' $1)

if [ "$COLUMN_COUNT" -ge 10 ]; then
        awk -F ',' '{OFS=","; print $6, $10}'  $1
    else
        echo "File does not contain 10 columns!"
fi  

}

CSV_FILE="./csv_files/trade.csv"

print_columns "$CSV_FILE"
