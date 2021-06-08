# Exercise 5: Craps

The goal is to practice more loops and conditional by building a Craps simulator. This exercise is inspired from the homework Lab 3 of CS 112 from the University of San Francisco.

## Requirement
Build a class <b>Craps</b> with a <b>play</b> method. See below section for the game direction. Upload a text of a player's info, along with his chip balance. Record the win or loss of each game, add the record of the game and update.
<br><br>
The Craps class requires 2 dice in the play method, build a class of <b>Die</b>, along with <b>roll</b> to randomly a number. In this exercise, build a fair die with 6 faces.

## Rules of Craps
Phase 1:<br>
First roll 2 dice. If the sum is 2, 3, 12, you lose; if the sum is 7 or 11, you win. Otherwise, you will receive the sum of 2 face value as game points and move on to Phase 2.
<br><br>
Phase 2:<br>
Continue to roll the dice until the sum of 2 dice to equal to 7 or the game points. If the sum is 7, the player loses; otherwise, the player wins.

## Files
Following files are available in this folder:
<ul>
	<li>Crabs.rb: Driver script</li>
	<li>records_template.csv: Template of csv file to save result</li>
	<li>records.csv: Example of csv files with a couple of game results</li>
</ul>
<br>
records_template.csv has 4 columns: time, result, phase1_point, phase2_point. Time records the timestamp when the game starts. result will be the record of whether the user has won or lose in that game, it stated either "Win" or "Lose". phase1_point, phase2_point stated the points the player get in the representative phase. If win or lose has been determined in phase 1, phase2_point would be empty.

## How the Program Works
The script has 2 classes available: Die and Crap. Die is a fair die by default, and it would randomly pick a number between 1 to 6 when you call the method <i>roll</i>. Crap is the class to play crap. In the main method, it will first initialize a Crap class, which initialize 2 dice with Die class. Once a Crap object is created and the method play in this class is called. It will roll 2 dices and obtain the points for the first phase. If win/loss is determined in the first phase, the method will return the result immediately; or else, the method will enter into the second phase and roll the dices again. It will enter a loop until win/loss is determined. When the game is completed, main method would save the result by appending to the record csv file.

