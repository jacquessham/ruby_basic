# Lesson 16: Date/Time
File for this lesson: <i>datetime.rb</i>
<br>
Useful standard package:
<ul>
	<li>Time</li>
	<li>Date</li>
</ul>
<br>
Time in Ruby is the Unix epoch, time zero is at 1st of January, 1970 midnight. To access this, use <b>Time.at(0)</b> where 0 is the epoch. An time object may use below method to access the time instance:
<ul>
	<li>sec: Second</li>
	<li>min: Minute</li>
	<li>hour: Hour</li>
	<li>day: Day</li>
	<li>month: Month</li>
	<li>year: Year</li>
	<li>wday: Number of day of the week, 0 is Sunday, 6 is Saturday</li>
	<li>yday: Number of day of the year</li>
	<li>isdst: Is Daylight Saving Time, return true or false</li>
	<li>t.zone: Time zone, return String</li>
</ul>
<br>
Time is 32-bits, date range between 1901-2037. Datetime is 64-bits, date range effectively infinite, so it is able to handle calendar reform.
<br>
In Datetime, use <b>strptime(time_string, time_string_format)</b> to convert string to datetime object. Below table is the reference:
<table>
	<tr><th>Format</th><th>Description</th><th>Example</th></tr>
	<tr><td>%A</td><td>Day of Week (Full Spelling)</td><td>Sunday</td></tr>
	<tr><td>%a</td><td>Day of Week (Abbreviated)</td><td>Sun</td></tr>
	<tr><td>%B</td><td>Month (Full Spelling)</td><td>October</td></tr>
	<tr><td>%b</td><td>Month (Abbreviated)</td><td>Oct</td></tr>
	<tr><td>%C</td><td>Century</td><td>20 (This is for 1900-1999)</td></tr>
	<tr><td>%c</td><td>Default Format in Time package (Equal to %a %b %e %H:%M:%S %Y)</td><td>Sun Jun 13 23:23:01 2021</td></tr>
	<tr><td>%D</td><td>American date format</td><td>06/12/21</td></tr>
	<tr><td>%d</td><td>Day of the month</td><td>20</td></tr>
	<tr><td>%F</td><td>%Y-%m-%d</td><td>2021-01-25</td></tr>
	<tr><td>%H</td><td>Hour, 24-hour clock</td><td>23</td></tr>
	<tr><td>%h</td><td>Month of the year (Abbreviated)</td><td>Oct</td></tr>
	<tr><td>%I</td><td>Hour, 12-hour clock</td><td>11</td></tr>
	<tr><td>%M</td><td>Minute of hour</td><td>59</td></tr>
	<tr><td>%m</td><td>Month of year (Number)</td><td>11</td></tr>
	<tr><td>%P</td><td>Lowercase meridian indicator (am or pm)</td><td>am</td></tr>
	<tr><td>%p</td><td>Uppercase meridian indicator (AM or PM) </td><td>AM</td></tr>
	<tr><td>%R</td><td>24-hour time format (%H:%M)</td><td>23:48</td></tr>
	<tr><td>%r</td><td>12-hour time format (%I:%M:%S %p)</td><td>11:48:01 PM</td></tr>
	<tr><td>%S</td><td>Second of the time</td><td>59</td></tr>
	<tr><td>%s</td><td>Epoch</td><td>1136053353</td></tr>
	<tr><td>%U</td><td>Week of year</td><td>52</td></tr>
	<tr><td>%w</td><td>Day of the week, 0-6, Sunday is 0</td><td>0</td></tr>
	<tr><td>%Y</td><td>Year</td><td>1995</td></tr>
	<tr><td>%y</td><td>Year without century</td><td>95</td></tr>
	<tr><td>%Z</td><td>Time Zone</td><td>GMT(Time)/ Z(Date)</td></tr>
	<tr><td>%z</td><td>Time Zone in +/- numbers</td><td>+0000</td></tr>
</table>
<br>
Multiple Date object is able to become a range object, or call <b>upto</b> on one Date object to create a range. Two Time object or Datetime objects may take a difference. But when subtracting two Datetime object, you have to convert to integer to print or use as a number.

Reference: <a href="https://www.rubyguides.com/2015/12/ruby-time/">Ruby Guides</a>

## Files
The file requires <b>Time</b> and <b>Date</b>. It will print the current time, epoch time 0, and the local time and GMT of start time of 2021 school year. After that, it will show how to declare date object, converting string to date object, printing date range and date difference.
