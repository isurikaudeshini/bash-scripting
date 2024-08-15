#!/bin/bash

# This script is written for checking a CSV file if a line contains same values in 2nd & 5th Coulmn and adding a prefix to the 5th & 9th Column.

prefix=PREFIX_ADDED
csv_file="csv_files/customers-10.csv"
temp_file=prefix_added_file.txt
header=$(head -n 1 "$csv_file")
[ ! -e filename.txt ] && touch $temp_file

echo "$header" > $temp_file


# Excluding header passing the rows of the csv.
tail -n +2 "$csv_file"  | while read line 
do

v2=$(echo  $line | awk -F ',' '{print $2}')
v5=$(echo  $line | awk -F ',' '{print $5}')

# Compare if column 2 and 5 are same and adding the 'PREFIX_ADDED' prefix to the 5th & 9th Columns
if [[ "$v2" == "$v5" ]]
then

v9=$(echo  $line | awk -F ',' '{print $9}')
echo  $line | awk -v prefx5="$prefix$v5" -v prefx9="$prefix$v9" -F, '{$5=prefx5; $9=prefx9 ; print}' OFS=,

else 

echo "$line" 

fi 

done >> $temp_file