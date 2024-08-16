#!/bin/bash

random_qoute() {

array=()
csv_file=$1
random_file=random.txt
row_count=$( tail -n +2 $csv_file | wc -l)
random_number_count=$( cat $random_file | wc -l)

[ ! -e $random_file ] && touch $random_file

# Assigning the random values to an array
while read -r line; do
    array+=("$line")
done < $random_file

# Check if random numbers are not repeated and generates the quote
while [[ $random_number_count -lt 15 ]]; do
  random_number=$(( $RANDOM % $row_count + 2 ))
  # random_number_count=$( cat $random_file | wc -l)
  echo "$random_number"
  if [[ ! ${array[@]} =~ $random_number ]]; then
        # echo "Random number added: $random_number"
        echo "$random_number" >> $random_file
        row=$(sed -n "${random_number}p" "$csv_file")

        IFS=',' read -r flower food color place country <<< "$row"
        echo "The $color $flower from $place is added into $food in $country"
        break  

  else
        echo "Random number is genrating, continuing loop..."
        sleep 1
  fi
done

if [[ $random_number_count -ge 15 ]]; then
    echo "Exited the loop because the maximum quotes has been generated."
fi

}


csv_file="csv_files/flower_food_color_place_country.csv"
random_qoute "$csv_file"










