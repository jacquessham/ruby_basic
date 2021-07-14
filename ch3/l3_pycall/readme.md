# Lesson 3: Pycall
Pycall can call Python function from Ruby. (Update on going...)

## Files

## Getting Started
First, use <b>PyCall.import_module("Python_package")</b> to initiate an Ruby object to import Python package. Then, directly call the Python function via the Ruby object. For example:

```
rnumpy = PyCall.import_module("numpy")
numarr = rnumpy.array([[1,3],[2,4]])
```

<br><br>
To execute Python code on Ruby: <b>PyCall.exec("Python code")</b>

## Supplemental Information
Some example for utilizing specific Python packages:
<br>
Numpy: PyCall.import_module("numpy")
<br>
Pandas: PyCall.import_module("pandas"


## Reference
Documentation: <a href="https://github.com/mrkn/pycall.rb">Here</a>