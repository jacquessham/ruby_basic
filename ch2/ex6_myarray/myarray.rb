class MyArray
	def initialize(arr=[], size=20)
		@size_incre = size
		@arr = Array.new(size) # Real array
		@arr_sorted = []
		@arr_stats = {} # Keep track elements
		@arr_size = 0 # how many elems in array
		@arr_maxsize = size # physical size of array

		puts arr
		# Add elems if arr is not empty
		if arr.size > 0
			then
				elem_notint = []
				for elem in arr do
					puts "Current elem is #{elem}"
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
	def add_arr_sort(elem)
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
	def is_int(elem)
		elem = Integer(elem) rescue nil
		if elem == nil then return false end
		return true
	end # end method

	def addElement(elem)
		if is_int(elem)
			then # If it is integer, do below
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
			right_arr = @arr[elem_pos..-1]
		end
		# Remove elem by merging left_arr and right_arr
		@arr = left_arr.concat(right_arr)
		@arr << nil
		@arr_size -= 1

		# Reassign @arr_stats
		# Remove elem position
		@arr_stats[elem]["count"] -= 1
		if @arr_stats[elem]["count"] == 0
			then @arr_stats.delete(elem)
		else
			then @arr_stats[elem]["position"] = @arr_stats[elem]["position"][1..-1]
		end
		# Reassign elem position in @arr_stats
		checked = []
		for sub_elem in right_arr
			if checked.include?(sub_elem)
				temp = @arr_stats[sub_elem]["position"]
				for i in 0..temp.size
					if pos > elem_pos then temp[i] -= 1 end # end if
				end # end for
				@arr_stats[sub_elem]["position"] = temp
				checked << sub_elem
			end # end if
		end # end for

		# Remove elem from @arr_sorted
		elem_pos_sorted = @arr_sorted.index(elem)
		@arr_sorted.delete_at(elem_pos_sorted)

		# Notify user elem is removed
		return true
	end # end method

	def shuffle
	end # end method

	def reserve
		# Set old @arr aside
		temp_arr = @arr
		# Redeclare a new array for @arr and @arr_stats
		@arr = Array.new(@arr_maxsize)
		# Make old position to become new postion
		old_pos = @arr_size - 1
		for i in 0..@arr_size
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
					@arr_stats[curr_elem]["position"] = i
			end # end if
			old_pos -= 1 # move on to next element
		end # end for
	end # end method

	def print_array
		for elem in @arr do	
			if elem != nil then print "#{elem} " end
		end # end for
		puts
	end # end method

	def distinct
	end # end method

	def findHCF(arr2)
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
		if @arr_size == 0 then return 0 
		elsif @arr_size == 1 then return arr[0] end

		if @arr_size % 2 ==1
			then
				target_index = Integer(@arr_size/2)
				return @arr_sorted[target_index]
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

	# Delete later
	def print_phycial_array
		for elem in @arr do	
			if elem != nil then print "#{elem} " else print "nil " end
		end # end for
		puts
	end

	# Delete later
	def print_stats(elem)
		puts @arr_stats[elem]
	end

	# Delete later
	def print_sorted
		puts "#{@arr_sorted}"
	end

end # end class

# For testing
a = MyArray.new(1..21)
a.addElement(1)
a.print_array
a.print_phycial_array
a.print_stats(1)
a.print_sorted

b = MyArray.new([5,1,2,3,4])
b.print_sorted

c = MyArray.new([5,21,12,3,14])
c.print_sorted
puts c.getMedian

d = MyArray.new([5,21,3,14])
d.print_sorted
puts d.getMedian