require 'pycall'


# Numpy
rnumpy = PyCall.import_module("numpy")
numarr1 = rnumpy.array([[1,3],[2,4]])
numarr2 = rnumpy.array([[3,1],[4,2]])
puts numarr1 + numarr2

# Pandas
pandas = PyCall.import_module("pandas")
df1 = pandas.DataFrame([['col1','col2'],['a',1],['b',2]])
puts df1


# Execute Python code
PyCall.exec('print([num for num in range(20) if num%2==1])')