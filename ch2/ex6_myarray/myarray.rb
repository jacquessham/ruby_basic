class MyArray
	def initialize(arr=[], size=20)
		@size_incre = size
		@arr = Array.new(size)
		@arr_size = 0 # how many elems in array
		@arr_maxsize = size # physical size of array

		# Add elems if arr is not empty
		if arr.size > 0
			then
				elem_notint = []
				for elem in arr do
					# Add integers
					if is_int(elem)
						then @arr << Integer(elem)
							 @arr_size += 1
					else elem_notint << elem
					end # end if
					# Expand physical size if full
					if @arr.size == @arr_maxsize
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
				@arr << Integer(elem)
				if @arr.size == @arr_maxsize
						then temp = Array.new(@size_incre)
							 @arr.concat(temp)
				end # end if
		else return false
		end # end if
		return true
	end # end method

	def print_array
		for elem in @arr do	
			if elem != nil then print "#{elem} " end
		end # end for
		puts
	end # end method

end # end class

# For testing
a = MyArray.new([1,2,3])
a.print_array
