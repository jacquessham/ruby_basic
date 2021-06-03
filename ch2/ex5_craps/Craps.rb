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
		@phase1_point = nil
		@phase2_point = nil
	end # end constuctor

	# Accessor
	attr_accessor :phase1_point
	attr_accessor :phase2_point

	# Return true if win, or false if lose
	def play
		p1 = @die1.roll
		p2 = @die2.roll
		@phase1_point = base_points =  p1 + p2
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
				@phase2_point = points = p1 + p2
				puts "You have rolled #{p1} and #{p2}, and received #{points} points!"
				if points == 7 then puts "You Lose!"; return false end
				break if points == base_points
			end # end loop
		end # end if
		puts "You Win!"
		return true
	end # end method
end # end class

def main
	game = Crap.new()
	starttime = Time.now.strftime("%d/%m/%Y %k:%M") # For record use
	result = game.play
	open("records.csv","a") do |row|
		if result
			then row << "#{starttime},Win,#{game.phase1_point},#{game.phase2_point}\n"
		else
			row << "#{starttime},Lose,#{game.phase1_point},#{game.phase2_point}\n"
		end # end if
	end # close the file
end # end main

main