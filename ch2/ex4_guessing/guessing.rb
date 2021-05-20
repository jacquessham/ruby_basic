class GuessingGame
	def initialize(low=0, high=100)
		@low = low
		puts "low is #{@low}"
		@high = high
		puts "high is #{@high}"
		@target = rand(low..high)
		puts "target is #{@target}"
	end # end constructor

	def play
		low = @low
		high = @high
		curr = -1
		while curr != @target
			print "Please enter an integer between #{low} and #{high}: "
			user_input = Integer(gets.chomp) rescue -1
			while user_input <= low or user_input >= high
				print "Invalid number! "
				print "Please enter an integer between #{low} and #{high}: "
				user_input = Integer(gets.chomp) rescue -1
			end # end inner while
			print "You have enter #{user_input}..."
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

	end # end method

end # end class

game = GuessingGame.new(0,100)
game.play