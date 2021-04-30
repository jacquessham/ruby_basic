# Exercise 3: Health Profiles

The goal of this exercise is to practice on defining classes, read and save files on Ruby. We will be simulate a health provider to calculate the simple health metrics for list of patients. This exercise is inspired from the homework Lab 2 of CS 112 from the University of San Francisco.

## Requirements
<ol>
	<li>Define a class for patient profile</li>
	<li>Read patients info from a CSV file</li>
	<li>Store all profile in an array and Print on Console</li>
	<li>Return patients statistics and save into a csv file</li>
</ol>

### Define a class for patient profile
Define a class called <b>HealthProfile</b> to take the information listed below of an individual patient:
<ul>
	<li>First name</li>
	<li>Last name</li>
	<li>Age</li>
	<li>Gender</li>
	<li>Height in inches</li>
	<li>Weight in pounds</li>
</ul>
<br>
Once the attributes are initialized, define the below methods:
<ul>
	<li>computeTargetHeartRateRange</li>
	<li>computeBMI</li>
	<li>toString</li>
</ul>

#### computeTargetHeartRateRange
This function calculates the range of target heart rate, return the range in string with "<i>minimum heart rate</i> - <i>maximum heart rate</i>". Target heart rate is bewteen 50-85% of the maximum heart rate, which is <i>220 - (age)</i>.

#### computeBMI
This function return a body mass index, by this formula: <i>Weight (lbs) x 703 / (Height (inches) x Height (inches))</i>

#### toString
Build a string with a summary of the patient with all instances and results calculated.

### Read patients info from a CSV file
Obtain all patients information from a csv file <i>(Coming Soon...)</i>, declare a <b>HealthProfile</b> for each patient.

### Store all profile in an array and Print on Console
After declaring <b>HealthProfile</b> objects for each patient, save in an array. Once it is done, call the <b>toString</b> function for each object to print the profile summary on the console.

### Return patients statistics and save into a csv file
At last, save the below information for each patient in a CSV file, name it <i>(Coming Soon...)</i>.
<ul>
	<li>First name</li>
	<li>Last name</li>
	<li>Maximum heart rate</li>
	<li>Target Heart Rate Range</li>
	<li>BMI</li>
</ul>

## Coming Soon...
