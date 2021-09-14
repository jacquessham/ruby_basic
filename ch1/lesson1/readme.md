# Lesson 1: Hello World!

File for this lesson: <i>helloworld.rb</i>
<br><br>
In Ruby, <b>puts</b> is the print statement. Same as <b>print</b> in Python. To print statement without next line, you may use <b>print </b>.

## Files
To begin the journey of learning Ruby, the script will print <b>Hello World!</b> to kick off the chapter.

## Running Scripts
To execute your ruby script, simply run <b>ruby some_script.rb</b> in your command line. 
<br><br>
<i>Gemfile.lock</i> is the file stated the version of Ruby and its dependence and it allows you to specify which gems to use in your scripts. In order to execute your script with your gemfiles, execute <b>bundle exec ruby <i>some_script.rb</i></b> in your command line. 

## Importing Gems/Scripts
In Ruby, you may use <b>require</b> to import a gem. To import a script you built, you may use <b>require_relative</b> with the script directory to do so. An example is the follow:

```
require 'json'
require 'csv'
require_relative 'script1'
require_relative 'other_folder/script2'
```