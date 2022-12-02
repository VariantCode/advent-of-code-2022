#!/bin/sh

tr ' ' '+' <input.txt> math.txt

# Part 1 logic

#sed -i "s/A+X/4/g" math.txt
#sed -i "s/B+X/1/g" math.txt
#sed -i "s/C+X/7/g" math.txt
#sed -i "s/A+Y/8/g" math.txt
#sed -i "s/B+Y/5/g" math.txt
#sed -i "s/C+Y/2/g" math.txt
#sed -i "s/A+Z/3/g" math.txt
#sed -i "s/B+Z/9/g" math.txt
#sed -i "s/C+Z/6/g" math.txt

# Part 2 logic

sed -i "s/A+X/3/g" math.txt
sed -i "s/B+X/1/g" math.txt
sed -i "s/C+X/2/g" math.txt
sed -i "s/A+Y/4/g" math.txt
sed -i "s/B+Y/5/g" math.txt
sed -i "s/C+Y/6/g" math.txt
sed -i "s/A+Z/8/g" math.txt
sed -i "s/B+Z/9/g" math.txt
sed -i "s/C+Z/7/g" math.txt

tr '\n' '+' <math.txt> scores.txt

sed -i "s/++/ /g" scores.txt

#echo "0" >> scores.txt

echo "\n" >> scores.txt

cat scores.txt | bc >> my-score.txt

#fold -w 24 scores.txt >> scores-math.txt

#sed -i "s/++/+/g" scores-math.txt

#sed -i "s/$/0/g" scores-math.txt

#sed -i "s/ 0/ /g" scores-math.txt

#echo "\n" >> scores-math.txt

#cat scores-math.txt | bc >> final.txt

#tr '\n' '+' <final.txt> final-math.txt

#echo "0" >> final-math.txt

#echo "\n" >> final-math.txt

#cat final-math.txt | bc > my-score.txt

exit
