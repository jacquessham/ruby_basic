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
							# Add elemnt to @arr_sort
							if @arr_sorted.size == 0
								then @arr_sorted << elem

							elsif @arr_sorted.size == 1
								then
									if elem > @arr_sorted[0]
										then @arr_sorted << elem
									else
										@arr_sorted = [elem, @arr_sorted[0]]
									end

							elsif  @arr_sorted.size == 2
								then
									if elem > @arr_sorted[1]
										then @arr_sorted << elem
									elsif elem > @arr_sorted[0]
										then @arr_sorted = [@arr_sorted[0], elem, @arr_sorted[1]]
									else @arr_sorted = [0].concat(@arr_sorted)
									end
							elsif @arr_sorted.size > 1
								loopgate = true
								i = 0
								curr = @arr_sorted[0]
								# if elem < curr, add elem in the front
								if elem < curr
									then @arr_sorted = [elem].concat(@arr_sorted); loopgate = false
								end # end if

								while loopgate
									puts "i now is #{i}"
									if i == @arr_sorted.size-1
										then
											puts "At the end of array"
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
										then i += 1; curr = @arr_sorted[i]; puts "next"; next
									end # end if

									# If not break, means the right position
									left_arr =  @arr_sorted[0..i]
									right_arr = @arr_sorted[i+1..-1]
									puts "while i at #{i}"
									puts "Before anything happens #{@arr_sorted}, curr is #{curr}"
									puts "left_arr is #{left_arr}"
									puts "right_arr is #{right_arr}"
									left_arr << elem
									@arr_sorted = left_arr.concat(right_arr)
									puts "The outcome is #{@arr_sorted}"
									loopgate = false
								end # end while
								
							end # end if
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

	# Helper function to check whether element is int
	def is_int(elem)
		elem = Integer(elem) rescue nil
		if elem == nil then return false end
		return true
	end # end method

	def addElement(elem)
		if is_int(elem)
			then
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
				if @arr.size == @arr_maxsize
						then temp = Array.new(@size_incre)
							 @arr.concat(temp)
				end # end if
				# Add elemnt to @arr_sort
				if @arr_sorted.size == 0
					then @arr_sorted << elem

				elsif @arr_sorted.size == 1
					then
						if elem > @arr_sorted[0]
							then @arr_sorted << elem
						else
							@arr_sorted = [elem, @arr_sorted[0]]
						end

				elsif  @arr_sorted.size == 2
					then
						if elem > @arr_sorted[1]
							then @arr_sorted << elem
						elsif elem > @arr_sorted[0]
							then @arr_sorted = [@arr_sorted[0], elem, @arr_sorted[1]]
						else @arr_sorted = [0].concat(@arr_sorted)
						end
				elsif @arr_sorted.size > 1
					loopgate = true
					i = 0
					curr = @arr_sorted[0]
					# if elem < curr, add elem in the front
					if elem < curr
						then @arr_sorted = [elem].concat(@arr_sorted); loopgate = false
					end # end if
								
					while loopgate
						puts "i now is #{i}"
						if i == @arr_sorted.size-1
							then
								puts "At the end of array"
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
							then i += 1; curr = @arr_sorted[i]; puts "next"; next
						end # end if

						# If not break, means the right position
						left_arr =  @arr_sorted[0..i]
						right_arr = @arr_sorted[i+1..-1]
						puts "while i at #{i}"
						puts "Before anything happens #{@arr_sorted}, curr is #{curr}"
						puts "left_arr is #{left_arr}"
						puts "right_arr is #{right_arr}"
						left_arr << elem
						@arr_sorted = left_arr.concat(right_arr)
						puts "The outcome is #{@arr_sorted}"
						loopgate = false
					end # end while
				end #end if
		else 
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
	end # end method

	def shuffle
	end # end method

	def reserve
		
	end # end method

	def distinct
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
		sum_value = 0
		elem_count = 0
		for elem in @arr_stats.keys do
			sum_value += @arr_stats[elem]["count"]*elem
			elem_count += @arr_stats[elem]["count"]
		end
		return (1.0*sum_value)/elem_count
	end # end method

	def getMedian
	end # end method

	def getSD
		sum_value = 0
		elem_count = 0
		for elem in @arr_stats.keys do
			sum_value += @arr_stats[elem]["count"]*elem
			elem_count += @arr_stats[elem]["count"]
		end
		mean =  (1.0*sum_value)/elem_count
		sum_value2 = 0
		for elem in @arr_stats.keys do
			sum_value2 += @arr_stats[elem]["count"]*((elem-mean)**2)
		end
		return (sum_value2/(elem_count-1))**0.5
	end # end method

	def print_phycial_array
		for elem in @arr do	
			if elem != nil then print "#{elem} " else print "nil " end
		end # end for
		puts
	end

	def print_stats(elem)
		puts @arr_stats[elem]
	end

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