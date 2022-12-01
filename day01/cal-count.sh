#!/bin/sh

touch elf-cal-list.txt

# Change newlines into + symbols

tr '\n' '+' <cal-count.txt> cal-count-math.txt

# Replace all instances of '++' with a newline to seperate the elfs

sed -i "s/++/\n/g" cal-count-math.txt

# Perform the math on the calories and output it to the elf-cal-list and sorting out the calories

cat cal-count-math.txt | bc > elf-cal-list.txt && sort -n elf-cal-list.txt > sorted.txt

# prints the highest value which happens to be at the end of the file

#tail -n1 sorted.txt

# Part 2; read the top three calorie holding elfs and write their values to a new file

tail -n3 sorted.txt > top-3.txt

# Translate the newlines into plus symbols

tr '\n' '+' <top-3.txt> top-3-math.txt

# add a zero to the end of the formula because bc doesn't like a + at the end

echo "0" >> top-3-math.txt

# Perform maths

cat top-3-math.txt | bc

exit
