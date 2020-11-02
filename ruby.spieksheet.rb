# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# https://www.linkedin.com/learning/ruby-essential-training-part-1-the-basics/

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# variable

$global_var = 12 # convention: var in 'snake_case' with letters_digits_underscore
def global_method
  local_var = 34
  ["one", "two"].reverse.each {|block_var| puts "#{ block_var.capitalize }" }
end
class myClass   # convention: class in CapitalizedCamelCase
  def Classmethod
    @@class_var = 56
    @instance_var = 78
  end
end
myInstance = myClass.new  # convention: instance in lowCapCamelCase

MY_CONSTANT = 90 # convention is all-caps, but Ruby only inspects first letter to be capital

100.class # returns name of the class

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# string

my_string = "Hello"
puts my_string + ' ' + "World!"
"Yada " * 3 # returns "Yada Yada Yada "
escaped_string = 'Let\'s escape!'

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# array

my_array = [1,2,3, "also a string is allowed"]
my_array << 'appended'
my_array << ['appended array', 'some more']
my_array[0] = "zero-based index"
my_array[-1] # returns ["appended array", "some more"]
my_array[-2] # returns "appended"
my_array.length # synonym: my_array.size
my_array.reverse! # use '!' to save the string in place
my_array.push # .pop .shift .unshift
[1,2,3] + [4,5,6] # concatenate arrays

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# hash

my_hash = {'key1' => 'value1', 'key2' => 'value2'}
my_hash.keys
my_hash.values
my_hash['key1'] = 'new value1'
my_hash.to_a # convert to array, returns: [["key1", "new value1"], ["key2", "value2"]]

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# symbol

# Symbol is kind of 'read-only-string', start with colon, no delimiters, used as keys in hash
:my_symbol.class # returns Symbol
my_hash = {"string_key" => "value1", :symbol_key => "value2"}
my_hash["string_key"] # returns "value1"
my_hash[:symbol_key]  # returns "value2"
# symbols are global unique instance-like things:
"string".object_id  # 70253774726280
"string".object_id  # 70253774744700
:symbol.object_id   # 881628
:symbol.object_id   # 881628
equivalent_hash = {:low => 2, :high => 8, :avg => 6} # rocket notation
equivalent_hash = {low: 2, high: 8, avg: 6}  # shorthand notation

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# boolean

my_boolean = true
my_boolean = false
# comparisons: == < > <= >= ! != && ||
[1,2,3].include?(1)     # true
2.between?(1,5)         # true
{'a'=>1}.has_key?('a')  # true
{'a'=>1}.has_key?(:a)   # false
{'a'=>1}.has_value?(1)  # true

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# range

inclusive_range = 1..10    #
exclusive_range = 1...10   #
exclusive_range = *1...10  # convert to array: [1, 2, 3, 4, 5, 6, 7, 8, 9]
(1..10).class  # Range
(1..10).first  #  1, alias: begin
(1..10).last   # 10, alias: end
('a'..'m').include?('g')  # true

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# nil

my_nil_var = nil
my_nil_var == false  # false
my_nil_var == nil    # true
my_nil_var.nil?      # true
!my_nil_var          # true
my_test_var = my_nil_var || 'default value'  # "default value"

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# control structures

if boolean_expression_1
  statement_1
elsif boolean_expression_2
  statement_2
else
  statement_3
end
#
unless boolean_expression  # is negation of if..end
  statement_1
end
#
case                         # note: no 'variable' after case
when boolean_expression_1
  statement_1
when boolean_expression_2
  statement_2
else
  statement_3
end
#
case integer_test_variable
when 1
  statement_1
when 2..5
  statement_2
else
  statement_3
end
#
result = boolean_expression ? "value if true" | "value if false"
#
result = variable_possibly_nil_or_false || variable_default
x ||= y  # equivalent to: x = y unless x

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# loop structures

i = 5
loop do
  break if i <= 0
  puts "Countdown: #{i}"
  i -= 1
end
#
i = 5
while i > 0
  puts "Countdown: #{i}"
  i -= 1
end
#
i = 5
until i <= 0
  puts "Countdown: #{i}"
  i -= 1
end

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# iterator

i = 5
i.times do
  puts "Countdown: #{i}"
  i -= 1
end
#
5.times     { puts "some" }
1.upto(5)   { puts "some" }
5.downto(1) { puts "some" }
(1..5).each { puts "some" }
#
5.downto(1) do |i|
  puts "Countdown: #{i}"
end
#
5.downto(1) {|i| puts "Countdown: #{i}"}
#
numbers : .times .upto .downto .step
range   : .each .step
string  : .each_line .each_char .each_byte
array   : .each .each_index .each_with_index
hash    : .each .each_key .each_value .each_pair
https://ruby-doc.org/core-2.7.2/Hash.html#method-i-each_pair
#
fruits = ['banana', 'apple', 'pear']
fruits.each {|fruit| puts fruit.capitalize}
for fruit in fruits {puts fruit.capitalize}
[1,2,3].each {|x| puts "#{x}"}

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Best Practices

# for ruby code files:
# use .rb extensions

# first line of file:
#!/usr/bin/env ruby

# exiting a program:
exit
exit!
abort
abort(msg)

# I/O
puts "var_string"     # auto adds "\n" line-return
print "var_string\n"  # add nothing, do yourself
var_string = gets     # get string until user types 'return'
chop var_string       # removes last line in string
chomp var_string      # remove only if whitespace

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Enumerables

# enumerable = set of items that can be countable: array, range, hash, string (sort of)
# these classes all include: module Enumerable
# https://ruby-doc.org/core-2.7.2/Enumerable.html
# has methods like: .count .each (etc)

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Code Block

#
do
  statement_1
  statement_2
  statement_3
end

#
{
  statement_1
  statement_2
  statement_3
}

my_hash = {low:2,high:8,avg:6}
#
my_hash.each do |k,v|
  puts "#{k.capitalize}: #{v}"
end
#
my_hash.each {|k,v| puts "#{k.capitalize}: #{v}" }

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Find methods

(1..10).find {|n| n == 5 }          # synomym: .detect
(1..10).find {|n| n % 3 == 0 }      # % is the 'modulo operator'
(1..10).find_all {|n| n % 3 == 0 }  # [3, 6, 9], synomym: .select
fruits = ['banana', 'apple', 'pear']
fruits.find {|f| f == 'pear' }      # "pear"
fruits.find {|f| f.length == 5 }    # "apple"
(1..10).any? {|n| n <=5 }           # true
(1..10).none? {|n| n <=5 }          # false
(1..10).all? {|n| n <=5 }           # false
(1..10).one? {|n| n <=5 }           # false
(1..10).one? {|n| n ==5 }           # true

#
numbers = [*1..10]                  # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers.delete_if {|n| n<= 5 }      # [6, 7, 8, 9, 10]

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Map methods

# synonym: collect

[*1..5].map {|n| n + 1 }  # [2, 3, 4, 5, 6]

my_hash = {low:2,high:8,avg:6}
my_hash.map do |k,v|
  "#{k.capitalize}: #{v * 100}"
end                       # ["Low: 200", "High: 800", "Avg: 600"]

fruits = ['banana', 'apple', 'pear']
fruits.map! {|f| f.capitalize}
fruits                    # ["Banana", "Apple", "Pear"]


# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Inject methods

# use to 'accumulate' something
# synonym: reduce

(1..5).inject {|memo, n| memo + n }   # 15

[3,5,7].inject {|memo, n| memo * n }  # 105

# note that the 'result' is remembered in memo:
(1..5).inject do |memo, n|
  memo + n
  x = 0
end                          # 0
#
(1..5).inject do |memo, n|
  if n % 2 == 0
    memo + n
  end
end                          # NoMethodError (undefined method `+' for nil:NilClass)
#
(1..5).inject do |memo, n|
  puts "#{memo}"
  if n % 2 == 0
    memo + n
  else
    memo
  end
end                          # 1, 3, 3, 7

# if no argument then memo is assigned first value in array, which is a string, so here assign 0 to start:
fruits = ['banana', 'apple', 'pear']
size = fruits.inject(0) do |memo, fruit|
  memo + fruit.length
end                         # 15

# the memo var can also be a string:
fruits = ['banana', 'apple', 'pear']
longest = fruits.inject do |memo, fruit|
  if fruit.length > memo.length
    fruit
  else
    memo                    # restate memo to remeber it
  end
end                         # "banana"

# the memo var can also be a string:
fruits = ['banana', 'apple', 'pear']
mash = fruits.inject('') do |memo, fruit|
  memo << fruit[0]
end                         # "bap"

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Sort methods

# comparison operator ('spaceship operator'):
value1 <=> value2  | .sort
------------------ | -----------
# -1 if less than  | moves left
#  0 if equal      | stays
# +1 if more than  | moves right

[5,8,2,6,1,3].sort {|v1,v2| v1 <=> v2}  # [1, 2, 3, 5, 6, 8]

# default sort order
fruits = ['banana', 'apple', 'pear']
x = fruits.sort                             # ["apple", "banana", "pear"]

x = fruits.sort do |fruit1, fruit2|
  fruit1.length <=> fruit2.length
end                                         # ["pear", "apple", "banana"]

x = fruits.sort_by {|fruit| fruit.length}   # ["pear", "apple", "banana"]

hash = {a:4,c:5,b:3}
hash.sort {|p1,p2| p1[0] <=> p2[0]}         # [[:a, 4], [:b, 3], [:c, 5]]

hash = {a:4,c:5,b:3}
hash.sort {|p1,p2| p1[1] <=> p2[1]}         # [[:b, 3], [:a, 4], [:c, 5]]

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Merge methods

h1 = {a:2, b:4, c:6}
h2 = {a:3, b:4, d:8}
h1.merge(h2)          # {:a=>3, :b=>4, :c=>6, :d=>8}
h2.merge(h1)          # {:a=>2, :b=>4, :c=>6, :d=>8}

# note: block is ONLY called when keys match
h1.merge(h2) {|key,old,new| new }         # is default

h1.merge(h2) {|k,o,n| o < n ? o : n }     # {:a=>2, :b=>4, :c=>6, :d=>8}

h1.merge(h2) {|k,o,n| o * n }             # {:a=>6, :b=>16, :c=>6, :d=>8}


# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Custom Methods

# method name: use lowercase with underscores, 'snake_case' with letters_digits_underscore
# last character can also be: ? ! =
my_method?  # returns boolean
my_method!  # saves in place
my_method=  # dunno

# define the method:
def welcome
  puts "Hello world!"
end                   # note that the return value is default 'nil' (is result of puts)

# call the method:
welcome

def blanket_patterns(colors, lines)
  lines.times do |i|
    first = colors[0]
    rest  = colors[1..-1]
    colors = rest + first
    puts colors
  end
end
blanket_patterns('++*~~*++*',20)

def volume(x,y,z)
  x * y * z
end
volume(2,3,4)   # 24

def volume x,y,z
  x * y * z
end
volume 2,3,4    # 24

# parentheses
# - always optional
# convention:
# - methods with    args do     use parentheses
# - methods without args do not use parentheses
#

# default argument values
def welcome(greet, name, punct='!')
  greet + ' ' + name + punct
end
puts welcome('Hello', 'friend')         # Hello friend!
puts welcome('Hello', 'friend', '?')    # Hello friend?

def out_of_stock(items=[])
  items.find_all {|item| item.qty == 0}
end

def method_with_default_values(required_arg1, required_arg2, optional_arg1=nil, optional_arg2=[])
  do_something
end

# common ruby pattern is to use a: options hash !
def welcome(greeting, options={})
  name  = options[:name]  || 'friend'
  punct = options[:punct] || '!'
  greeting + name + punct
end

# return value by default is the last operation's value
# or explicitly:
def some
  return "return_string"
end

# best Practice: explicit return by restating:
def subtract(n1, n2)
  result = n1 - n2
  result = 0 if result < 0
  result
end

# Ruby methods can only return ONE value
# use Array or Hash to return multiple values
def add_and_subtract(n1, n2)
  add = n1 + n2
  sub = n1 - n2
  {:add => add, :sub => sub}
end
result = add_and_subtract(8,3)
a = result[:add]
s = result[:sub]

# or use return-array and assign directly:
def add_and_subtract(n1, n2)
  add = n1 + n2
  sub = n1 - n2
  [add, sub]
end
a, s = add_and_subtract(8,3)

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# https://www.linkedin.com/learning/ruby-essential-training-part-2-classes-and-modules/

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Classes

# class convention:
# - class name in Singular (!) and in CapitalizedCamelCase (!)

# Best Practice:
# - each class in seperate file
# - all class-files in common folder

# instance convention
# - variable name in lowercase snake_case

my_string = String.new    # ""
my_array  = Array.new     # []
my_hash   = Hash.new      # {}

class ShoppingCart
end
shopping_cart = ShoppingCart.new

# instance variables:
class Animal
  def make_noise
    @noise
  end
  def set_noise
    @noise = 'Oink!'
  end
end
pig = Animal.new
pig.set_noise
pig.make_noise

# reader and writer methods:
# note: no access to @class_var from outside instance, must use methods
# or said differently: methods are the primary way to access data in an instance

# classical way:
class Animal
  def get_noise
    @noise
  end
  def set_noise(value)
    @noise = value
  end
end

# Ruby classical:
class Animal
  def noise
    @noise
  end
  def noise=(value)
    @noise = value
  end
end

# more compact: attribute methods
# attr_* methods:
# attr_reader     = readable only
# attr_writer     = writable only
# attr_accessor   = both R/W
class Animal
  attr_reader :noise
end
#
class Animal
  attr_writer :noise
end
#
class Animal
  attr_accessor :noise
end

# can mix:
class Radio
  attr_reader :volume
  def volume=(value)
    return if value < 1 || value > 10
    @volume = value
  end
  def crank_it_up
    @volume = 11
    # or use 'self'
    #self.volume = 11
  end
  def volume_status
    "Current volume: #{@volume}"
  end
end

# 'self' refs the current instance from code inside the instance

# Method Access Control
# - public      # anyone can access (=default)
# - protected   # only allow access for this class and subclasses
# - private     # only allow access for this class (not subclasses)

class SomeClass
  class public_method
  end
protected
  class protected_method
  end
private
  class private_method
  end
end

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Item

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Item

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
