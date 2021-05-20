class MyArray
	def initialize(arr=[])
		size = 20
		if arr.size == 0
			then
				@arr = Array.new(size)
				@arr_size = size
				@arr_maxsize = 0
		else
			@arr = Array.new(size)
			@arr_size = size
			@arr_maxsize = 0
			# Need to change later
			# Need to loop arr check all elements are int

		end # end if

	end # end constructor

	def addElement()

	end # end method

end # end class