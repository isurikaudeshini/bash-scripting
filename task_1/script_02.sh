#!/bin/bash

prefix=PREFIX_ADDED

while read line 
do

v2=$(echo  $line | awk -F ',' '{print $2}')
v5=$(echo  $line | awk -F ',' '{print $5}')



if [[ "$v2" == "$v5" ]]
then


v9=$(echo  $line | awk -F ',' '{print $9}') 


new_line=$(echo  $line | awk -v prefx="$prefix$v5" -F, '{$5=prefx; print}' OFS=,)
sed -i "s/${line}/${new_line}/s" customers-100.csv
# sed -ie 's///' customers-100.csv
# echo $line  | sed -i "s/$v9/$prefix$v9/g" customers-100.csv
echo "The end"
fi

# sed "s|\$ROOT|${HOME}|g" abc.sh

done < customers-100.csv