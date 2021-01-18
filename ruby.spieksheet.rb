# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# https://github.com/jdg71nl/ruby-rails-spieksheet/
# https://github.com/jdg71nl/ruby-rails-spieksheet/blob/master/ruby.spieksheet.rb
# https://jdg71nl.github.io/ruby-rails-spieksheet/
# https://jdg71nl.github.io/ruby-rails-spieksheet/ruby.spieksheet.html
# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
#
# https://www.linkedin.com/learning/ruby-essential-training-part-1-the-basics/

# hint sites:
# - https://code-maven.com/ruby

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

# interpolation:
my_interpolation_string = "my_string = #{my_string} "

# encoding: utf8
# https://www.rubyguides.com/2019/05/ruby-ascii-unicode/
file_string.encode("ASCII", "UTF-8", invalid: :replace, undef: :replace, replace: "")

# - - - + - - -
# regex info, Regular Expressions:
# https://ruby-doc.org/core-2.7.2/Regexp.html
# https://ruby-doc.org/core-2.7.2/Regexp.html
# https://www.rubyguides.com/2015/06/ruby-regex/

if "Do you like cats?" =~ /like/
  puts
end

if "Do you like cats?".match(/like/)
  puts "Match found!"
end

Line = Struct.new(:time, :type, :msg)
LOG_FORMAT = /(\d{2}:\d{2}) (\w+) (.*)/
def parse_line(line)
  line.match(LOG_FORMAT) { |m| Line.new(*m.captures) }
end
parse_line("12:41 INFO User has logged in.")
# This produces objects like this:
# <struct line="" time="12:41" ,="" type="INFO" msg="User has logged in."> </struct>

# .match() -- # https://ruby-doc.org/core-2.4.0/MatchData.html
#
m = /(.)(.)(\d+)(\d)/.match("THX1138.")
m          #=> #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
m[0]       #=> "HX1138"
m[1, 2]    #=> ["H", "X"]
m[1..3]    #=> ["H", "X", "113"]
m[-3, 2]   #=> ["X", "113"]
#
m = /(?<foo>a+)b/.match("ccaaab")
m          #=> #<MatchData "aaab" foo:"aaa">
m["foo"]   #=> "aaa"
m[:foo]    #=> "aaa"

puts /a/.class
# Regexp

"this is some string".scan(/\w+/)
# => ["this", "is", "some", "string"]
#
str = "lord of the rings"
str.gsub(/\w+/) { |w| w.capitalize }
# => "Lord Of The Rings"

replacements = {
  'i' => 'eye', 'e' => 'eei',
  'a' => 'aya', 'o' => 'oha'}
word = "Cocoa!55"
word.gsub(Regexp.union(replacements.keys), replacements)
# "Cohacohaaya!55"

a = "foo.bar.size.split('.').last"
a.split(/\.(?=[\w])/) # the lookahaed pattern (?=[\w]) only matches the dot if followed by a word-character
# ["foo", "bar", "size", "split('.')", "last"]

m = "David 30".match /(?<name>\w+) (?<age>\d+)/
m[:age]
# => "30"
m[:name]
# => "David"

# Look Ahead & Look Behind
(?=pat) 	Positive lookahead
(?<=pat) 	Positive lookbehind
(?!pat) 	Negative lookahead
(?<!pat) 	Negative lookbehind
#
def number_after_word?(str)
  !!(str =~ /(?<=\w) (\d+)/)
end
number_after_word?("Grade 99")

# Regex Options
"abc".match?(/[A-Z]/i)
i 	ruby regex case insensitive
m 	dot matches newline
x 	ignore whitespace

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

my_hash = { :foo => 'bar', :baz => 'qux' }
my_struct = Struct.new(*my_hash.keys).new(*my_hash.values)
my_struct.baz
=> "qux"
my_struct.foo
=> "bar"
#
# or if you need to map the keys to symbols:
my_struct = Struct.new(*my_hash.keys.map { |str| str.to_sym }).new(*my_hash.values)

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
# comparisons: == < > <= >= ! != && ||    # note: instead of 'and', 'or' ruby uses: && ||
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
# nil   # note: ruby does not use 'null'

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
result = boolean_expression ? "value if true" : "value if false"
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

# initialize method (called automatically when .new() is called)
class Animal
  attr_accessor :noise
  def initialize()
    @noise = 'Oink!'
  end
end
pig = Animal.new

# common to call initialize with options-hash argument:
class Animal
  attr_accessor :noise
  def initialize(options={})
    @noise = options[:noise] || 'Grrr!'
  end
end
pig = Animal.new({name: 'Oink!'})

# https://ruby-doc.org/core-2.7.2/Object.html#method-i-instance_variable_get
# https://ruby-doc.org/core-2.7.2/Object.html#method-i-instance_variable_set
# https://ruby-doc.org/core-2.7.2/Object.html#method-i-instance_variables
#
class Machine
  def initialize
    @water = "yes"
    @steam = "yes"
  end
end
machine = Machine.new
machine.instance_variables
=> [:@water, :@steam]
machine.instance_variable_get(:@water)
=> "yes"

my_hash = { :foo => 'bar', :baz => 'qux' }
my_hash.each { |name, value| instance_variable_set(name, value) }
# equivalent:
my_hash.each &method(:instance_variable_set)
# if the instance variable names are missing the "@", you'll need to add them, so it would be more like:
my_hash.each { |name, value| instance_variable_set("@#{name}", value) }

# get Class from a string holding the classname:
# https://stackoverflow.com/questions/5924495/how-do-i-create-a-class-instance-from-a-string-name-in-ruby
# DOES NOT WORK: class_ref = Object.const_get(class_name)
class_ref = class_name.constantize

# dynamically send message (method):
instance = MyClass.new
method_name = "my_method"
instance.public_send(method_name)  # effects: MyClass.my_method

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Class methods and attributes (not Instance methods!)

# ask the Class something (that maybe is not related to a specific instance)
Animal.new
Invoice.find(3812)
Bicycle.all_brands

class SomeClass
  def self.method_name
  end
end

# in documentation use '#' to denote an instance-method:
Array.new   # Class method
Array#size  # Instance method

class Animal
  @@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']
  @@total_animals = 0
  @@current_animals = []
  def initialize
    @@total_animals += 1
    @@current_animals << self
  end
  def self.species
    @@species
  end
end

# in Ruby,  there is no attr_* method equivalent
# in Rails, there is: cattr_* methods equivalent

# but there are reader/writer methods:
class Animal
  @@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']

  def self.species
    @@species
  end

  def self.species=(array)
    return unless array.is_a?(array)
    @@species = array
  end

  end
end

# call 'class method' from instance:
my_instance = MyClass.new
my_instance.class.my_method  # effects: MyClass.my_method

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Class Inheritance

class Animal
  attr_accessor :noise
end

class Pig < Animal
  def initialize
    @noise = 'Oink!'
  end
end

class Cow < Animal
  def initialize
    @noise = 'Moo!'
  end
end

# override and extend
class Sofa
  @@can_open = false
  attr_accessor :width, :length
  def area
    width * length
  end
end

class SofaBed < Sofa
  @@can_open = true
  attr_accessor :length_opened, :is_open
  def area
    is_open ? width * length_opened : width * length
  def area_better
    is_open ? width * length_opened : super
  end
end

irb>
sof = SofaBed.new
sof.width = 2
sof.length = 3
sof.length_opened = 4
sof.area
sof.is_open = true
sof.area

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Time

# Ruby stores time as number of seconds since January 1, 1970
# can have fraction

Time.now        # 2020-11-02 20:54:40 +0100
Time.now.to_i   # 1604346886
Time.new(year, month, day, hour, min, sec, utc_offset)
tomorrow = Time.now + (60*60*24)
tomorrow.year       # 2020
tomorrow.yday       # 308
tomorrow.wday       # 2
tomorrow.sunday?    # false
tomorrow.tuesday?   # true
Time.now.nsec       # 278155000
Time.now.zone       # "CET"
Time.now.dst?     #false
Time.now.gmtime  # 2020-11-02 20:00:13 UTC
  
# https://www.tutorialspoint.com/ruby/ruby_date_time.htm
Time.now.strftime("%a %Y-%b-%d %H:%M:%S %Z")

# Date

# Date = similar to Time, but includes additional methods, but in STL and need to load
require 'date'
Date.today                    #<Date: 2020-11-02 ((2459156j,0s,0n),+0s,2299161j)>
Date.today.month              # 11
Date.new(2018,10,1)           #<Date: 2018-10-01 ((2458393j,0s,0n),+0s,2299161j)>
Date.new(2018,10,1).to_time   # 2018-10-01 00:00:00 +0200
Time.now.to_date              #<Date: 2020-11-02 ((2459156j,0s,0n),+0s,2299161j)>
Date.today.leap?        # true
Date.today.cweek        # 45
Date.today.cwday        # 1
Date.today.next_day     #<Date: 2020-11-03 ((2459157j,0s,0n),+0s,2299161j)>
Date.today.prev_day     #<Date: 2020-11-01 ((2459155j,0s,0n),+0s,2299161j)>
Date.today.gregorian?   # true
Date.today.julian?      # false

# DateTime

# 'DateTime' is subclass of 'Date' (only use this for historican time, see docs)
# load is same:
require 'date'
DateTime.now            #<DateTime: 2020-11-02T21:08:58+01:00 ((2459156j,72538s,370498000n),+3600s,2299161j)>
DateTime.new(2016,10,1,2,45,0,'+7')   #<DateTime: 2016-10-01T02:45:00+07:00 ((2457662j,71100s,0n),+25200s,2299161j)>
DateTime.now.to_time    # 2020-11-02 21:09:32 +0100
Time.now.to_datetime    #<DateTime: 2020-11-02T21:09:35+01:00 ((2459156j,72575s,440158000n),+3600s,2299161j)>

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Modules : Namespacing

module MakeSparks
  class Date
    # ...
  end
end

dinner = MakeSparks::Date.new
dinner.date = Date.new

# Modules : Mixins

# Ruby only allows some class to inherit from one superclass
# instead: share code in package and include as 'mixin' (like Swift:protocol)

module Nameable
  attr_accessor :first_name, :last_name
  def full_name
    "#{first_name} #{last_name}"
  end
end

module ContactInfo
  attr_accessor :city, :state, :zip
  def city_state_zip
    "#{city}, #{state} #{zip}"
  end
end

class Person
  include Nameable
  include ContactInfo
end

class Supplier
  include ContactInfo
end

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Load, require, include

# load source file in-place
load 'file' # returns: true or false

# load source file in-place, but only once
require 'package' # returns: true or false

require 'date'  # expects file to be in $LOAD_PATH
require '/Users/bsmith/project/classes/customer'
require_relative 'modules/addressable'

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Exceptions

# are classes for handling exceptional events

# rescue in code block:
begin
  1/0
rescue
  puts "exception handled"
end

# rescue in method:
def divide(x,y)
  x / y
rescue
  puts "exception handled"
end

# rescue on different types:
def divide(x,y)
  x / y
rescue ZeroDivisionError
  puts "ZeroDivisionError handled"
rescue TypeError, ArgumentError
  puts "TypeError or ArgumentError handled"
rescue => e
  puts "#{e.class} handled"
end

# likewise:
Exception#class
Exception#message
Exception#backtrace
Exception#full_message

# raise an error:
def even_numbers(array)
  unless array.is_a?(array)
    raise ArgumentError
  end
  if array.length == 0
    raise StandardError.new("Too few arguments")
  end
  array.find_all {|el| el.to_i % 2 == 0 }
end

# raise a 'default' exception:
class Radio
  def volume=(value)
    if value < 1 || value > 10
      raise "Too loud!"
    end
    @volume = value
  end
end
begin
  r = Radio.new
  r.volume = 20
rescue RunTimeError => e
  puts e.message
end

# create and raise custom exception class:
class TooLoudError < StandardError
  def initialize(msg=nil)
    super(msg || "Too loud!")
  end
end
class Radio
  def volume=(value)
    if value < 1 || value > 10
      raise TooLoudError
    end
    @volume = value
  end
end
begin
  r = Radio.new
  r.volume = 20
rescue TooLoudError => e
  puts e.message
end

# create and raise custom exception class WITH extra info:
class TooLoudError < StandardError
  attr_reader :volume
  def initialize(value, msg=nil)
    super(msg || "Too loud!")
    @volume = value
  end
end
class Radio
  def volume=(value)
    if value < 1 || value > 10
      raise TooLoudError.new(value)
    end
    @volume = value
  end
end
begin
  r = Radio.new
  r.volume = 20
rescue TooLoudError => e
  puts "Volume #{e.volume}: #{e.message}"
end

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# https://www.linkedin.com/learning/ruby-essential-training-part-3-files-formats-templates/

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# I/O and Files

puts "string adds newline"
print "string adds no newline, so do it yourself!\n"
read = gets.chomp

# Class File < IO

# instead of: /shared/lib/myfile.rb
# instead of: C:\shared\lib\myfile.rb
# better use:
File.join('shared', 'lib', 'myfile.rb')   # "shared/lib/myfile.rb"

__FILE__
File.expand_path(__FILE__)
File.dirname(__FILE__)
File.expand_path(File.dirname(__FILE__))
__dir__

# create new file:
file = File.new(filepath, 'w')
file.do_stuff
file.close

# open existing file:
File.open(filepath, 'w') do |file|
  # do_stuff
end # file auto close!

# write to a file:
file = File.new('groceries.txt', 'w')
file.puts "Grocery List"
file.print "+ butter\n"
file.write "+ milk\n"
file << "+ sugar\n"
file.close

# read from a file (by characters):
file = File.new('groceries.txt', 'r')
string1 = file.read(4)
string2 = file.read(4)
file.close

# read from a file (by characters):
file = File.new('groceries.txt', 'r')
line1 = file.gets.chomp
line2 = file.gets.chomp
line3 = file.gets.chomp
line4 = file.gets.chomp
file.eof?               # true
file.close

# read all lines:
File.open('groceries.txt', 'r') do |file|
  while line = file.gets
    puts line.chomp.reverse
  end
end # file auto close!

# or better:
File.open('groceries.txt', 'r') do |file|
  file.each_line do |line|
    puts line.chomp.reverse
  end
end # file auto close!

file = File.new('groceries.txt', 'r')
string1 = file.read(4)
file.pos      # 4
file.pos += 6
file.pos = 20
file.rewind

# with line-numbers:
File.open('groceries.txt', 'r') do |file|
  while line = file.gets
    puts "Line #{file.lineno}: #{line}"
  end
end # file auto close!

# read a file at once:
blob = File.read(filepath)

# or as array:
array = File.readlines(filepath)  # does not remove newline

# write at once:
File.write(filepath, string)

File.rename(oldname, newname)
File.delete(filepath)

# for copy need to include:
require 'fileutils'
FileUtils.copy(ori_path, dup_path)
FileUtils.move # or rename
FileUtils.remove
FileUtils.cd
FileUtils.pwd
FileUtils.chown
FileUtils.chown
FileUtils.chmod
FileUtils.touch
FileUtils.ln

File.exists?(filepath)
File.exists?('groceries.txt')   # true
File.file?(filepath)
File.directory?(filepath)
File.readable?(filepath)
File.writable?(filepath)
File.executable?(filepath)
File.size(filepath)
File.dirname(filepath)
File.basename(filepath)
File.extname(filepath)

# extras:

# read from stdin:
instring = ""
while STDIN.gets
  instring = instring + $_
end

# access to environment variables:
my_ppath = ENV['PATH']
#
# can also manipulate:
system("echo $PATH")
ENV['PATH'] = '/nothing/here'
system("echo $PATH")

# arguments to ruby script are in: ARGV (array):
for i in 0 ... ARGV.length
   puts "#{i} #{ARGV[i]}"
end

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# Directories

Dir.mkdir(filepath)
# or
require 'fileutils'
FileUtils.mkdir(filepath)

Dir.delete(filepath)
Dir.empty?(filepath)

require 'fileutils'
FileUtils.rmdir(filepath)
# force:
FileUtils.rm_r(filepath)

path = File.join('', 'Users', 'name', 'Desktop')
Dir.chdir(path)

Dir.chdir('rel_dir')
Dir.chdir('..')

array = Dir.entries(filepath)  # includes '.' and '..'

Dir.entries('.').each do |entry|
  next if ['.', '..'].include?(entry)
  puts "#{entry}: " + (File.file?(entry) ? 'file' : 'dir')
end

# Glob = returns an array of filenames which match a pattern (like regular expression)
array = Dir.glob('*')

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# CSV, JOSN, YAML, XML

require 'csv'
CSV.foreach("file.csv") do |row|
  # some
end

array_of_arrays = CSV.read("file.csv")

CSV.open('file.csv', 'w') do |csv|
  csv << ["row", "of", "CSV", "data"]
end

# https://ruby-doc.org/core-2.7.0/Array.html#method-i-zip
labels = header.map {|item| item.downcase.gsub(/\s/, '_')}
new_array = presidents.map do |row|
  labels.zip(row).to_h
end

require 'json'
json = File.read("file.json")
hash = JSON.parse(json)
#
json = JSON.generate(hash)
json = {'enabled' => true}.to_json
File.write("file.json", json)

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
# ERB

require 'erb'
template = "The Year is <%= Time.new.year %>."
renderer = ERB.new(template)
puts renderer.result

# - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - - - - - + - - -
