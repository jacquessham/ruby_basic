require 'csv'

class HealthProfile
	def initialize(fname, lname, age, gender, height, weight)
		@fname = fname
		@lname = lname
		@age = age
		@gender = gender
		@height = height
		@weight = weight
		computeTargetHeartRateRange
		computeBMI
	end # end constructor

	# Setters + Getters
	attr_accessor :fname
	attr_accessor :lname
	attr_accessor :age
	attr_accessor :gender
	attr_accessor :height
	attr_accessor :weight
	attr_accessor :max_heart_rate
	attr_accessor :targetHeartRateRange
	attr_accessor :bmi

	def computeTargetHeartRateRange
		@max_heart_rate = 220 - @age
		@targetHeartRateRange = "#{@max_heart_rate*0.5}-#{@max_heart_rate*0.85}"
		return
	end # end method

	def computeBMI
		@bmi = @weight*703/(@height**2)
		return
	end # end method

	def toString
		str = "First name: #{@fname}\n"
		str += "Last name: #{@lname}\n"
		str += "Age: #{@age}\n"
		str += "Gender: #{@gender}\n"
		str += "Height: #{Integer(@height/12)} feet #{Integer(@height%12)} inches\n"
		str += "Weight: #{@weight}\n"
		str += "Target Heart Rate Range: #{@targetHeartRateRange}\n"
		str += "BMI: #{@bmi}"
		return str
	end # end method
end # end class

def main
	# Read patients csv file
	df_patients = CSV.read("sample_patients.csv")
	df_patients_cols = df_patients[0]
	df_patients = df_patients[1..df_patients.size]
	# Make an array of patients profile
	patients_profiles = []
	for patient in df_patients
		curr = HealthProfile.new(patient[0],patient[1],Integer(patient[2]),patient[3],Integer(patient[4]),Integer(patient[5]))
		curr.computeTargetHeartRateRange
		curr.computeBMI
		patients_profiles << curr
	end # end for
	# Print all toString to each patient
	for patient in patients_profiles
		puts patient.toString
		puts "------------------------------------"
	end # end for
	# Save all patients profile to csv
	profiles_file = File.new("sample_patients_profiles.csv","w")
	profiles_file.syswrite("fname,lname,mhr,thrr,bmi\n")
	for patient in patients_profiles
		profiles_file.syswrite("#{patient.fname},#{patient.lname},#{patient.max_heart_rate},#{patient.targetHeartRateRange},#{patient.bmi}\n")
	end # end for

end # end main

main