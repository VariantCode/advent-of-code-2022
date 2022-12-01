#!/bin/sh

touch elf-cal-list.txt

# Change newlines into + symbols

tr '\n' '+' <cal-count.txt> cal-count-math.txt

# Replace all instances of '++' with a newline to seperate the elfs

sed -i "s/++/\n/g" cal-count-math.txt

# Perform the math on the calories and output it to the elf-cal-list and find the highest calories

cat cal-count-math.txt | bc > elf-cal-list.txt && sort -n elf-cal-list.txt > sorted.txt

tail -n1 sorted.txt

#bc -q cal-count-math.txt > elf-cal-list.txt && sort -n elf-cal-list.txt > sorted.txt && tail -n1

#cat elf-cal-list.txt | sort -n | tail -n1

#touch sorted.txt

#sort -n elf-cal-list.txt > sorted.txt

#tail -n1 sorted.txt

exit
