class GuessingGame
	def initialize(low=1, high=10)
		# Make sure low is an integer
		begin
			@low = Integer(low)
		rescue  
			puts "Invalid input, assigning to 1"
			@low = 1
		end # end try-catch

		# Make sure high is an integer
		begin
			@high = Integer(high) 
		rescue 
			puts "Invalid input, assigning to 10"
			@high = 100
		end # end try-catch
		
		# Catch if low >= 0
		if @low < 1
			then puts "The lower bound must be ap positive number, reassign it to 1..."
				@low = 1
		end # end if
		# Catch if high >= 10
		if @high < 10
			then 
				print "There must at least 8 numbers to pick from, "
				puts "reassign the upper bound to 10..."
		end # end if
		# Catch if high-low >= 10
		if @high - @low < 9
			then 
				print "There must at least 8 numbers to pick from, "
				puts "resetting the upper bound..."
				@high = @low + 9
		end # end if

		@target = rand(@low+1..@high-1)
	end # end constructor

	def play(filename)
		starttime = Time.now.strftime("%d/%m/%Y %k:%M") # For record use
		low = @low
		high = @high
		curr = -1 # For user input
		round = 0 # Keep track how many round has taken
		puts "Welcome to the Guessing Game!"
		# Play the game
		while curr != @target
			# Ask user to pick a number for this round
			print "Please enter an integer between #{low} and #{high}, exclusively: "
			user_input = Integer(gets.chomp) rescue -1
			# Catch if user do not enter an integer within range
			while user_input <= (low) or user_input >= (high)
				print "Invalid number! "
				print "Please enter an integer between #{low} and #{high}: "
				user_input = Integer(gets.chomp) rescue -1
			end # end inner while
			puts
			puts "You have enter #{user_input}..."
			# Increment round after user has really enter a valid answer
			round += 1
			# Check if user pick the right number
			if user_input == @target
				then curr = user_input; puts "You got it!"
			elsif user_input < @target
				then 
					puts "#{user_input} is too low"
					curr = low = user_input
			else
					puts "#{user_input} is too high"
					curr = high = user_input
			end # end if
		end # end while

		# Save the record
		t = 
		open(filename,"a") do |row| 
			row << "#{starttime},#{@low},#{@high},#{@target},#{round}\n"
		end # close the file
		puts "Hope you have enjoy the game. Please come back again!"

	end # end method

end # end class

def main
	game = GuessingGame.new(1, 100)
	game.play("guess_records.csv")
end # end method

main