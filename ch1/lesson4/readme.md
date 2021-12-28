# Lesson 4: Method
File for this lesson: <i>use_methods.rb</i>
<br>
Functions are called <b>Methods</b> in Ruby. The syntax starts by <b>def</b> and end with <b>end</b>, like below:

```
# Method with no parameter
def method_no_para
puts "This method has no parameter"
end

# Method with 1 parameter
def method_1para(var1)
puts var1
end

# Method with 2+ parameters, with default values
def method_2para(var1=1, var2=2)
puts "We have received #{var1} and #{var2}"
end

# Method to return object
def method_return
return 1
end

# Method to return more than 1 object
def method_2returns
i = 1
j = 2
return i,j
end
```
<br><br>
If you use <b>break</b> in the method, the method will stop immediately. Note that the last line of the method will be return even if not stated purposefully.
<br><br>
\*\*Note: You may not restrict the parameter data type. Alternatively, you would have to examine the data type within the method and handle the type inconsistency.\*\*

## Files
The scripts begin declaring 2 methods with no return object: one with 1 parameter with default value, and one with 2 parameters with default values. There are 2 methods declared afterward, one with 1 return object and one with 2 return objects. Then, the script will run those methods.
