# Lesson 1.16 Time and Date
require 'date'

# Begin and end statment
BEGIN{puts"This is Lesson 16, we are going over Time and Date in Ruby"}
END{puts"This concludes Lesson 17"}

# Time
time_now = Time.now
puts "The time now is #{time_now}! And today is #{time_now.wday} day of the week."
time_zero = Time.at(0)
puts "Epoch starts at #{time_zero}"
time_school_start = Time.local(2021,9,1,8,30,0)
time_school_start_gm = Time.gm(2021,9,1,8,30,0)
puts "Next school year of the local school starts at #{time_school_start}, or #{time_school_start_gm} in London"

# Datetime
datetime_now = DateTime.now
datetime_written = DateTime.new(2021,6,12)
datetime_written_str = datetime_written.to_s
puts "This script is written on #{datetime_written_str}."
datetime_now = DateTime.now
puts "The time now is #{datetime_now}"

datetime_schooltime = Date.strptime("1/9/21","%d/%m/%y").to_s
puts "School starts on #{datetime_schooltime}"
datetime_schooltime_local = Date.strptime("01-09-2021 08:30:00 PST", "%d-%m-%Y %H:%M:%S %Z")
puts "The local school starts on #{datetime_schooltime_local}"

# Date range
(Date.new(1995,1,15)..Date.new(1995,2,1)).each{|day| puts day}
Date.new(1996,1,15).upto(Date.new(1996,1,20)).each{|day| puts day}

# Date/Time difference
time_nextsec = time_now + 1
puts "The next second of now is #{time_nextsec}"
datetime_tmr = time_now + (60*60*24)
puts "Tomorrow is #{datetime_tmr}"
puts "I can confirm tomorrow is #{datetime_now + 1}"
datetime_early = DateTime.new(1996,6,3)
datetime_later = DateTime.new(1996,10,15)
puts "datetime_later and datetime_ealry are #{(datetime_later-datetime_early).to_i} days apart"

=begin
Expected Outcome:
This is Lesson 16, we are going over Time and Date in Ruby
The time now is 2021-06-12 15:37:55 -0700! And today is 6 day of the week.
Epoch starts at 1969-12-31 16:00:00 -0800
Next school year of the local school starts at 2021-09-01 08:30:00 -0700, or 2021-09-01 08:30:00 UTC in London
This script is written on 2021-06-12T00:00:00+00:00.
The time now is 2021-06-12T15:37:55-07:00
School starts on 2021-09-01
The local school starts on 2021-09-01
1995-01-15
1995-01-16
1995-01-17
1995-01-18
1995-01-19
1995-01-20
1995-01-21
1995-01-22
1995-01-23
1995-01-24
1995-01-25
1995-01-26
1995-01-27
1995-01-28
1995-01-29
1995-01-30
1995-01-31
1995-02-01
1996-01-15
1996-01-16
1996-01-17
1996-01-18
1996-01-19
1996-01-20
The next second of now is 2021-06-12 15:37:56 -0700
Tomorrow is 2021-06-13 15:37:55 -0700
I can confirm tomorrow is 2021-06-13T15:37:55-07:00
datetime_later and datetime_ealry are 134 days apart
Now datetime_early is 1996-06-03T00:00:00+00:00 after adding a month to
This concludes Lesson 17	
=end