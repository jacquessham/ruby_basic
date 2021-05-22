class MyArray
	def initialize(arr=[], size=20)
		@size_incre = size
		@arr = Array.new(size) # Real array
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
		else 
			puts "This element #{elem} you gave is not a integer..."
			return false
		end # end if
		return true
	end # end method

	def print_array
		for elem in @arr do	
			if elem != nil then print "#{elem} " end
		end # end for
		puts
	end # end method

	def print_phycial_array
		for elem in @arr do	
			if elem != nil then print "#{elem} " else print "nil " end
		end # end for
	end

	def print_stats(elem)
		puts @arr_stats[elem]
	end

end # end class

# For testing
a = MyArray.new(1..21)
a.addElement(1)
a.print_array
a.print_phycial_array
a.print_stats(1)