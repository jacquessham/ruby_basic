class Die
	def initialize(face=6)
		@low = 1
		@high = face
	end # end constructor

	def roll
		return rand(@low...@high)
	end # end method
end # end Class

class Crap
	def initialize
		@die1 = Die.new()
		@die2 = Die.new()
	end # end constuctor

	# Return true if win, or false if lose
	def play
		p1 = @die1.roll
		p2 = @die2.roll
		base_points =  p1 + p2
		puts "You have rolled #{p1} and #{p2}, and received #{base_points} points!"
		if [2,3,12].include?(base_points)
			then puts "You Lose!"; return false
		elsif base_points == 7 or base_points == 11
			then puts "You Win!"; return true
		else
			puts "Now entering Phase 2..."
			loop do
				p1 = @die1.roll
				p2 = @die2.roll
				points = p1 + p2
				puts "You have rolled #{p1} and #{p2}, and received #{points} points!"
				if points == 7 then puts "You Lose!"; return false end
				break if points == base_points
			end # end loop
		end # end if
		puts "You Win!"
		return true
	end # end method
end # end class

game = Crap.new()
game.play