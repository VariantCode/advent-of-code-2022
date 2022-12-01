Advent of Code 2022: Journal
======

VariantCode
------

______

## Day01

Where to begin? I should start with my choice of language; I went with Shell script for one reason 
and that is because Linux seems to have a command line tool for any and every job. If the time comes 
where you can't find a tool to do the job; you can more likely than not repurpose a tool for your 
needs. This was my downfall to an extent. I spent way too much time going back and forth between the 
different man pages of various tools. I knew what I wanted to do but the getting the execution to 
play out as I knew it should was the hard part.

As the challenge states; we need to take the input, which is a list of intergers where the seperator 
value for the individual elves is a blank line, and then add up all the values that the individuals 
carry to find the elf that is holding the most snacks. So our program needs to do the following...

1. Find the sum of the calories that each elf holds individually.
2. Identify the elf carrying the most calories

... Unfortunately this isn't the case and what our program __needs__ to do looks something like this 
...

1. Prep the input text to be ready to have math performed on it.
2. Ensure your prep work keeps the individual elves seperate.
3. Find the sum of the calories that each elf carries.
4. Sort through the summed list to find the elf with the most snacks.

Easy enough but the question now is how to get from zero to one and that answer came to me in the 
form of two tools, `sed` and `tr`. If you look in the `cal-count.sh` file the first thing you see 
_other than me making a file for later_ is me making use of `tr` to change newlines into + symbols. 
I thought about trying to use `sed` for this but after spending again __way__ too long in the man 
pages I came to the conclusion that using `tr` would be much simpler. My thought was using `tr` I 
can take the input text, translate all newline characters into plus symbols, and pipe that to a new 
text file to be parsed. However doing this made one long string of numbers being added up. How the 
input text was laid out left a blank line to seperate the elves. Meaning that all that blank line is, 
is a newline character which, when run through the `tr` logic in my script, gives us a nice pattern 
where the seperation of the elves are. From here I turned to `sed` to find the "seperator pattern", 
which was `++`, and replaced them all with a newline character to seperate out all the elves. This 
next part is the one where I ran into the most trouble. Crunching the numbers was the biggest pain 
all due to my own stupidity. Now currently in my script I use `cat` to pull the text from the file 
and pipe the standard output to be worked on by `bc`. Before I was calling `bc` directly here which 
caused my script to hang and not pass this part. What I found was that `bc` only really likes to be 
explicitly told what to do otherwise it likes to have a brain fart. In all seriousness `bc` was 
hanging up and not finishing the math (and writing to file) like I instructed because it was waiting 
for me to give it some more direction. To solve this I just needed to call the math that needs to be 
done out to standard output to be worked on. Next in the same line as `bc` I use the `&&` operator 
to lead into the `sort` command with the `-n` flag to sort the list numerically and pumped out to 
another text file. Finally for the solving the first part I used `tail -n1` to read the last line of 
the final counts (we read the last line because of how `sort` works by default, sorting from lowest 
to highest). Part two required taking the input, finding the top 3 calorie holding elves and then 
sum them together. Commenting out my last line I use `tail` again this time passing the -n3 flag to 
read the last (top) three elves and push that to a new file to be worked with. If it isn't broke, 
don't fix it. I went back to `tr` to sub out the newlines for a + symbol. This time `sed` wasn't 
going to be able to help me cleanup the rogue + in this file but maybe the + at the end of the file 
won't make things go wrong, Right? Wrong, `bc` hated my guts for daring to pass it an equation with 
a random + at the end. So i just used `echo` to tack on a 0 at the end of the file so `bc` would do 
the math without yelling at me. Finally, I use `cat` to push the math to standard output so `bc` can 
do it's magic. 

#### Day01 closing thoughts

All in all it was a nice little challenge but I don't know if I will continue to be a psychopath and 
do the challenges as they release at midnight. I was really tired and it made concentrating hard but 
I pulled through somehow. Also I am kinda impressed that if I condensed my code down to the vital 
bits then I completed this challenge with ten lines of code. Also looking back I could absolutely 
make this code a lot cleaning and not make as many un-needed files.

______

## Day02
