# Exercise 4: Guessing Game

The goal is to practice more loops and conditional by building a guessing game. This exercise is inspired from the homework Lab 3 of CS 112 from the University of San Francisco.

## Requirement
Write a class called <b>GuessingGame</b> that contains play() method to play a Guessing game with the user. The program should pick a integer between 1 and 100 (inclusive), then repeatedly prompt the user to guess the number. After each guess, the program should print whether the user's guess is too high or too low. Your code should print "You got it!" once the user guesses correctly. The user should be able to end the game at any point by entering a 0. You should also keep track of the record of how many rounds it take the user to guess the number. Provide a empty file <i>guessing_records_empty.csv</i> with only headers as template, use the template and fill out the result for each game and save as <i>guessing_records.csv</i> for every game. See below section for detail and instructions of this file.

## File
There are 3 files in this folder:
<ul>
	<li><b>guessing.rb</b>: The driver program</li>
	<li><b>guess_records_empty.csv</b>: The template CSV file to save game results</li>
	<li><b>guess_records.csv</b>: The game results of creator's record</li>
</ul>

<br>
Note that, you only need <b>guessing.rb</b> and <b>guess_records_empty.csv</b> to play, guess_records.csv is just an example how it looks like.
<br><br>
In <b>guess_records_empty.csv</b>, it contains 5 columns: play_time, low_range, high_range, target, rounds. play_time records timestamp when the guessgame starts, target is the target number the program randomly picked for user to guess, low_range and high_range are the numbers that the program pick the target number, and rounds is the number of rounds it took user to guess the target number.

## How the Program works
<b>guessing.rb</b> will first create an object with <i>GuessingGame</i> class. When initializing an object, you are required to enter 2 positive numbers in order for the program to pick a number between these 2 numbers. These 2 numbers are required at least 10 aparted. If the difference is less than 10, the program will set the larger number to be 10 more than smaller number. If the smaller number is not a positive number, the program will assign it to be 1 as the smallest possible positive number. If the entered smaller number is larger than large number, the program will treat it as the difference is less than 10 and add 10 to the larger number.
<br><br>
Once the program has pick a number for user to guess, it will provoke the <b>run</b> method and ask user to guess the number until user has guess that target number. If the user guess a number smaller than target number, the program will notify user the number is too low. In the next round, the program will provide user a narrower range of numbers for user to guess; likewise if user guess a larger number than the target number. Once the user guess the target number, the program will notify user and save the result to <b>guess_records.csv</b> (You may name it with different name, but it is required to have the same format as <b>guess_records_empty.csv</b>). It will add a row to this file with the timestamp when the game start, number of rounds it takes the user to guess the number, target number and the range of numbers to pick the target number.
<br><br>
Each run of the program will only provoke run once.