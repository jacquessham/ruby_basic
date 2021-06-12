class MyArray
	def initialize(arr=[], size=20)
		@size_incre = size
		@arr = Array.new(size) # Real array
		@arr_sorted = []
		@arr_stats = {} # Keep track elements
		@arr_size = 0 # how many elems in array
		@arr_maxsize = size # physical size of array

		# Add elems if arr is not empty
		if arr.size > 0
			then
				elem_notint = []
				for elem in arr do
					# Add integers
					if is_int(elem)
						then # Add element to physical array
							@arr[@arr_size] = Integer(elem)
							# Check if this elem has a profile in @arr_size
							if @arr_stats.include?(elem)
								then # Add info if so
									@arr_stats[elem]["count"] += 1
									@arr_stats[elem]["position"] << @arr_size
								else
									@arr_stats[elem] = {}
									@arr_stats[elem]["count"] = 1
									@arr_stats[elem]["position"] = [@arr_size]
							end # end if
							add_arr_sort(elem)
							@arr_size += 1
					else elem_notint << elem
					end # end if

					# Expand physical size if full
					if @arr_size == @arr_maxsize
						then temp = Array.new(@size_incre)
							 @arr.concat(temp)
					end # end if	

				end # end for
				if elem_notint.size > 0
					then puts "The following elements you gave are not integers..."
						puts elem_notint
				end # end if
		end # end if
	end # end constructor

	
	# Add element to @arr_sort to keep track
	private def add_arr_sort(elem)
		if @arr_sorted.size == 0
			then @arr_sorted << elem

		elsif @arr_sorted.size == 1
			then
				if elem > @arr_sorted[0]
					then @arr_sorted << elem
				else
					@arr_sorted = [elem, @arr_sorted[0]]
				end

		elsif @arr_sorted.size == 2
			then
				if elem > @arr_sorted[1]
					then @arr_sorted << elem
				elsif elem > @arr_sorted[0]
					then @arr_sorted = [@arr_sorted[0], elem, @arr_sorted[1]]
				else @arr_sorted = [elem].concat(@arr_sorted)
				end
		elsif @arr_sorted.size > 2
			loopgate = true
			i = 0
			curr = @arr_sorted[0]
			# if elem < curr, add elem in the front
			if elem < curr
				then @arr_sorted = [elem].concat(@arr_sorted); loopgate = false
			end # end if

			while loopgate
				if i == @arr_sorted.size-1
					then
						if elem >= curr
							then @arr_sorted << elem
						else
							left_arr = @arr_sorted[0..-2]
							left_arr << elem
							left_arr << curr
							@arr_sorted = left_arr
						end # end if 
				loopgate = false
				break # If i == @arr_sorted.size-1, break right away
				end # end if 

				# Compare elements in @arr_sorted and elem
				if curr < elem
					then i += 1; curr = @arr_sorted[i]; next
				end # end if

				# If not break, means the right position
				left_arr =  @arr_sorted[0..i]
				right_arr = @arr_sorted[i+1..-1]
				left_arr << elem
				@arr_sorted = left_arr.concat(right_arr)
				loopgate = false
			end # end while
		end # end if
	end # end method

	# Helper function to check whether element is int
	private def is_int(elem)
		elem = Integer(elem) rescue nil
		if elem == nil then return false end
		return true
	end # end method

	def addElement(elem)
		if is_int(elem)
			then # If it is integer, do below
				@arr[@arr_size] = Integer(elem)
				@arr_size += 1
				# Check if this elem has a profile in @arr_size
				if @arr_stats.include?(elem)
					then # Add info if so
						@arr_stats[elem]["count"] += 1
						@arr_stats[elem]["position"] << @arr_size
					else
						@arr_stats[elem] = {}
						@arr_stats[elem]["count"] = 1
						@arr_stats[elem]["position"] = [@arr_size]
				end # end if
				# If @arr.size hit max size, add more size to @arr
				if @arr.size == @arr_maxsize
						then temp = Array.new(@size_incre)
							 @arr.concat(temp)
				end # end if
				add_arr_sort(elem)	
		else # If it is not integer, do nothing and notify user
			puts "This element #{elem} you gave is not a integer..."
			return false
		end # end if
		return true
	end # end method

	def find(elem)
			# check if elem in arr
			if !@arr_stats.include?(elem) then return nil end
			return @arr_stats[elem]["position"]
		end # end method

	def remove(elem)
		# Check if elem exist
		if !@arr_stats.include?(elem) then return false end
		# Find the elem position
		elem_pos = find(elem)[0]
		# Then get left_arr and right_arr for @arr
		# Obtain left_arr
		if elem_pos == 0
			then left_arr = []
		else
			left_arr = @arr[0..elem_pos-1]
		end # end if
		# Obtain right arr
		if elem_pos == @arr_size
			then right_arr = []
		else
			right_arr = @arr[elem_pos+1..-1]
		end # end if

		# Remove elem by merging left_arr and right_arr
		@arr = left_arr.concat(right_arr)
		@arr << nil
		@arr_size -= 1

		# Reassign @arr_stats
		# Remove elem position
		@arr_stats[elem]["count"] -= 1
		if @arr_stats[elem]["count"] == 0
			then @arr_stats.delete(elem)
		end # end if
		
		# Reassign elem position in @arr_stats
		# First delete position
		for key in @arr_stats.keys
			@arr_stats[key]["position"] = []
		end # end for

		# Then reassign position
		for pos in (0..@arr_size-1)
			curr = @arr[pos]
			@arr_stats[curr]["position"] << pos
		end # end for

		# Remove elem from @arr_sorted
		elem_pos_sorted = @arr_sorted.index(elem)
		@arr_sorted.delete_at(elem_pos_sorted)

		# Notify user elem is removed
		return true
	end # end method


	def shuffle
		# Save the old @arr
		temp_arr = @arr
		@arr = Array.new(@arr_maxsize)
		# Generate a new position which is no i nor taken in pos_taken
		shuffle_again = true
		while shuffle_again
			shuffle_again = false
			new_pos = (0..@arr_size-1).to_a.shuffle
			for i in 0..new_pos.size
				if new_pos == i
					then shuffle_again = true
				end # end if
			end # end for
		end # end while

		# Assign new position
		for i in 0..new_pos.size-1
			@arr[new_pos[i]] = temp_arr[i]
		end # end for

		# Reassign elem position in @arr_stats
		# First delete position
		for key in @arr_stats.keys
			@arr_stats[key]["position"] = []
		end # end for

		# Then reassign position
		for pos in (0..@arr_size-1)
			curr = @arr[pos]
			@arr_stats[curr]["position"] << pos
		end # end for
		return true
	end # end method

	def reverse
		# Set old @arr aside
		temp_arr = @arr
		# Redeclare a new array for @arr and @arr_stats
		@arr = Array.new(@arr_maxsize)

		# First delete position
		for key in @arr_stats.keys
			@arr_stats[key]["position"] = []
		end # end for

		# Make old position to become new postion
		old_pos = @arr_size-1
		for i in 0..@arr_size-1
			curr_elem = temp_arr[old_pos] # Current element
			@arr[i] = curr_elem # Assign new position
			# Record the count and position of new position
			if @arr_stats.include?(curr_elem)
				then # Add info if so
					@arr_stats[curr_elem]["count"] += 1
					@arr_stats[curr_elem]["position"] << i
				else
					@arr_stats[curr_elem] = {}
					@arr_stats[curr_elem]["count"] = 1
					@arr_stats[curr_elem]["position"] = [i]
			end # end if
			old_pos -= 1 # move on to next element
		end # end for
		return true
	end # end method


	def print_array
		result = []
		@arr.each{|elem| result << elem unless elem.nil?}
		puts result.to_s
	end # end method

	def distinct
		# Copy @'s to temp variables
		temp_arr = @arr
		temp_arr_sorted = @arr_sorted
		temp_arr_stats = @arr_stats
		temp_arr_size = @arr_size

		@arr = Array.new(@arr_maxsize)
		# Update @arr_size = temp_arr_stats.keys.size
		@arr_size = temp_arr_stats.keys.size
		# Redeclare @arr_sorted and @arr_stats
		@arr_sorted = []
		@arr_stats = {}

		# Declare checked to keep track if element added
		checked = []
		curr_pos = 0 # To keep track which index added to @arr
		# Loop over temp_arr
		for elem in temp_arr do
			if !checked.include?(elem) and elem.kind_of?(Integer)
				then @arr[curr_pos] = elem
					 @arr_stats[elem] = {}
					 @arr_stats[elem]["count"] = 1
					 @arr_stats[elem]["postion"] = [curr_pos]
					 add_arr_sort(elem)
					 checked << elem
					 curr_pos += 1
			end # end if
		end # end for
		return true
	end # end method


	def findLargestCommonNumber(arr2)
		temp = arr2
		arr2 = []
		temp.each{|elem2| arr2 << elem2 if elem2.is_a?(Integer)}
		result = nil
		for elem in @arr_stats.keys
			for elem2 in arr2
				if elem == elem2 and result.nil?
					then result = elem
				elsif elem == elem2 and elem > result
					then result = elem
				end # end if
			end # end inner for
		end # end outer for
		if result == nil then puts "No Common number found" end
		return result
	end # end method

	def getMean
		if @arr_size == 0 then return 0 end
		sum_value = 0
		elem_count = 0
		for elem in @arr_stats.keys do
			sum_value += @arr_stats[elem]["count"]*elem
			elem_count += @arr_stats[elem]["count"]
		end
		return (1.0*sum_value)/elem_count
	end # end method

	def getMedian
		if @arr_size == 0 then return 0.0 
		elsif @arr_size == 1 then return arr[0].to_f end

		if @arr_size % 2 ==1
			then
				target_index = Integer(@arr_size/2)
				return @arr_sorted[target_index].to_f
		end # end if

		target_index_low = Integer(@arr_size/2) - 1
		target_index_high = Integer(@arr_size/2)

		return (@arr_sorted[target_index_low] + @arr_sorted[target_index_high])/2.0
	end # end method

	def getSD
		# First obtain mean
		sum_value = 0
		elem_count = 0
		for elem in @arr_stats.keys do
			sum_value += @arr_stats[elem]["count"]*elem
			elem_count += @arr_stats[elem]["count"]
		end
		mean =  (1.0*sum_value)/elem_count
		# Then take sum of square of element minus mean
		sum_value2 = 0
		for elem in @arr_stats.keys do
			sum_value2 += @arr_stats[elem]["count"]*((elem-mean)**2)
		end
		return (sum_value2/(elem_count-1))**0.5
	end # end method
end # end class


# For testing
puts "Case 1"
a = MyArray.new(1..21)
# Add 1
a.addElement(1)
a.print_array
puts a.find(1).to_s
puts "----------------------------------------"
# Remove 1
puts a.remove(1)
puts a.print_array
puts "----------------------------------------"
# Remove second 1
puts a.remove(1)
puts a.print_array
puts "----------------------------------------"
# Remove 11
a.remove(11)
puts a.print_array
puts "----------------------------------------"
puts "Case 2"
b = MyArray.new([5,1,2,3,4])
b.remove(3)
b.print_array
b.shuffle
b.print_array
b.reverse
b.print_array
puts "----------------------------------------"

puts "Case 3"
c = MyArray.new([5,21,12,3,14])
puts c.getMean
puts c.getMedian
puts c.getSD
puts c.findLargestCommonNumber([3,4,5,6])
puts "----------------------------------------"

puts "Case 4"
d = MyArray.new([5,21,3,14])
puts d.find(5)
puts d.remove(5)
d.print_array
d.shuffle
d.print_array
puts "----"
d.reverse
d.print_array
d.addElement(3)
d.addElement(3)
d.print_array
puts "----"
d.distinct
d.print_array
puts "----"
puts d.findLargestCommonNumber([5])
puts d.getMean
puts d.getSD
puts d.getMedian