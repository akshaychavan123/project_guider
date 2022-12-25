# ruby Tutorial smartherd


# Single Line Cooments

=begin
this is 
the multiline coments
=end

# END {
#     puts "This will at Last"
# }
# BEGIN {
#     puts "this code will start at aFirst"

# }
# puts "middle portion of "

#Chech the differnence Between The Prinnt and Puts
# print("Ckecking") 
# puts "checking" 
# print("Another")

# puts "checking"
# print("Ckecking")
# puts "another "


#Taking inputs From The user
# puts "Enter Your Name : "
# name= gets                new line character is added
# name = gets.chomp         it will remove the new line charaacter
# name = gets.chomp.to_i    Getting the integer fromuser
# name = gets.chomp.to_f    Converting 
# name = gets.chomp.to_f    Converting user input to Float value

# numb = 20.1256498
# puts numb.round(2)  Rounding The Number To LAst twoDecimal Digits


# Methods And Functions In Ruby
#function name should always start with a lowercase Characters
# def func
#     puts "am a aFunction Statement"
# end
# func

#  Function With Parameter
# def func(a,b,c)
#     puts a+b
#     return c  
# end
# d=func(14,15,"Hello World")
# puts d

#taking number of Parameters And Ccesing it by iterate
#  def func(*c)
#     c.each {|k|puts "#{k}"}
   
#     for i in 0..c.length
#         puts c[i]
#     end
#  end
#  func "akshay","Ganesh","sachin"

# a = [10,20,20,60,40]
# for i in 0..a.length
#     puts i
# end
#  puts a.length
# k= "akshay"
# for m in 0...k.length
#     puts k[m]
# end
# puts k.size
# puts a.size

#ruby Conditional Statement
# if elsif Else 

# puts "Suppose we are taking age as a input From user"
# age = 26
# if age < 18 
#     puts 'dont Drink'
# elsif age > 18
#     puts "This Statement Will Execute"
# else 
#     puts " if input is wrong This Willl Execute"
# end 

 # Ruby Case Statement

# Suppose We Are Taking day as a input From user 

# day = "FRiday"
# case day
# when day ="monday"
#     puts "today is a Monday"
# when day ="wednesday"
#     puts "today is a Wednesday"
# when day ="FRiday"
#     puts "today is a Friday"
# when day ="Sunday"
#     puts "today is a Sunday"
# else
#     puts " any Other dday" 
# end

#Ruby class 
# class Lirary
#     @@var = "books are stored in library"
#     attr_accessor :name , :age
#     def initialize(name,age)
#       @name,@age = name,age
#     end
#     def get_area(a,b) 
#         puts "#{@age}"
#         puts "area of the rectangle is #{a*b}" 

#     end 
# end
# class Student < Lirary
#                              #cant create a double constructor for this class as it is  accesising Constructor 
#     def get_area(s,t)
#         super
#         puts s+t
#     end
# end
# obj = Student.new("akshay",26)
# obj.get_area(10,20)
# puts obj.name   # This Instance variable cant be accessed without attr_accessor Method
# puts obj.get_area(12,32) # method Overriding 




# getter and setter are are used to access and set the values for 
# class Library
#     def initialize(width,height)
#         @width , @height = width , height
    # end
    # #this one is a getter method
    # def getwidth
    #     puts "width is llikely upto #{@width}"
    # end
    # def getheight
    #     puts "height is llikely upto #{@height}"
    # end

    # #  now we are implementing a setter method
    # def setwidth=(v)
    #     @width = v
    # end
    # def setheight=(v)
    #     @height = v 
#     end
# end
# obj = Library.new(200,100)
# obj.setheight=500
# obj.getheight 


# 15 Shortcut to getter and setter

# attr_accessor :width , :height
# attr_reader :width , :height        only getter
# attr_writer :width , :height             setter 

# class Parent
#     attr_accessor :a ,:b
#     def initialize(a,b)
#         @a , @b = a,b
#     end
# end
# obj = Parent.new(458,798)
# obj.a=369
# puts obj.a
# puts obj.b
 
# until loop
# d = 0
# until d> 5
#     puts "printing the values #{d}"
#     d=d+1
# end 

#while loop 
# f = 0 
# while f <5
#     puts "printing values from#{f}" 
#     f = f+1
# end 

# for loop in ruby used to iterete a sequencing number
# lst = [3,2,1,6,9,8]
# for i in lst
#     puts i
# end
 

# var = "this is variable and"
# for i in 0...var.length
#     puts var[i]
# end

#more on loops
# 5.times do 
#     puts "hix"
# end 

# 3.upto(7) do
#     puts "hi"
# end 

#we can also wwrite above code in oneline

# 3.times {|i| puts "#{i}"}

# 0.step(20,5) do puts "hi" end

# break stetement in ruby  and next statement
# it will be better if we put both next and break statement after the if condition 
# for i in 0..10
#     puts i 
#     if i==5
#         break
#     end
# end 
# while using next statement check that we are printing value at last

# for i in 0..10
     
#     if i==5
#         next
#     end
#     puts i
# end 

# redo statement in Ruby can goes for infinite loop dont ron the code  below
# for i in 0..5
#     if i < 2
#         puts i 
#         redo
#     end
# end 

# blocks in ruby 
# def test
#     puts "first statement in def"
#     yield
#     puts " our block is called"
# end
# test{puts "this is our block"}

# blocks with Parameter 
# def test
#     puts "first statement in def"
#     yield "hello world"
#     puts " our block is called"
# end
# test{|k|puts "this is our block with the parameter and para value is #{k}"} 

# blocks withn  call method or with Ampersand
# def test(&b)
#     puts "first statement in def"
#     b.call
#     puts " our block is called"
# end
# test{puts "this is our block"} 


# def test(&b)
#     puts "first statement in def"
#     b.call(10)
#     puts " our block is called"
# end
# test{|k|puts "this is our block with para value of #{k} "} 

#Above are the example of blocks inline
# now we we checks for multiline blocks
# BEGIN{
#     puts "this is first statement"
# } 

# puts "This is multiline block"
# for i in 0..4
#     puts i
# end
# END{
#     puts "this is print At the End"
# } 

#Moduls Provide namespace and anameclashes means can have two different methods with same name in two diff classe
# and wont collapse 
# modules implement the mixin facility 

# module Parent
#     No_Children = 3
#     def Parent.sum(a,b)
#         puts a+b
#     end
#     def Parent.print
#         puts No_Children
#     end
# end 

# puts Parent::No_Children
# Parent.sum(10,20)

# Another Method is module with classes

# module Parent
#     class First
#         @@No_Kids = 2
        

#         No_Children = 3
#         def sum(a,b)
#             puts a+b
#         end
#         def print
#             puts No_Children
#         end
#     end
# end 
# obj = Parent::First.new
# obj.sum(23,23)

# require And Require relative And Include Statement
# $LOAD_PATH<<'.'
# require "filename"

# require_relative "filename"

# include statement used in Class 
# it provide the mixins facility
# inclde modulename 

# Arrays in Ruby 
# data = Array.new() creating an Array 
#  data = [10,20, 60 , "akshay",54.3,false]
#  puts data
# for i in data
#     puts i
# end

# data.each do 
#     |i|puts "#{i}"
# end

# this above itereation can be done in a single line using Block 
# data.each{|i| puts i}  


# Accessing data sing Index value 
# puts data[0]
# data[0] = 30.22122 this is updating data

# Adding at the end
# data << "rajaram" 
# puts data.pop             remove Last Element
# data.pop(2)               remove Last two Elemnt
#  digits = Array(0..10)    array of digits

# data = [10,20, 60 , "akshay",54.3,false] 
# fruit = ["mango","appe"]
# s = Array.new(fruit)              copying Array
#  c = fruit + data                 concatination
#  d = data.concat(fruit)           concatination
# data.unshift(10)
# data.push(56)
# puts data.first(3)
# puts data.last(3) 
# puts data.include?(10) 
# puts data.reverse
# puts data.index(false)

# g = [ 10,32,13,43,52] 
# puts g.sort
# puts g.sort.reverse
# puts data[0,3]                      slicing in array    or puts data[0..3]
#  puts data.delete(10)
#  data.delete_at(3)
#  data.shift
#  data.empty?
# c= data|g 
# c = a&b   
  

# Hashes i Ruby 
# data = Hash.new
# data["name"]="akshay"
# data.store("age" , 26) 
# data.store("roll" , "first") 
# puts data
# countries = {"in" => "india" , "us"=>"amerika" ,
#     "uk"=>"london","jp"=>"japan","dl"=>"delhi"}
# puts countries["us"]
# puts countries.fetch('dl')
# puts countries.values_at("jp")
# countries["in"]="indonesia"
# countries.delete("jp") 
# puts countries.keys
# puts countries.values
# countries.each {|k,v| puts "the value for #{k} are #{v}"} 
# countries.each_key{|k| puts k}
# countries.each_value{|k| puts k} 
# puts countries.invert  
# puts countries.include?("in")
# puts countries.has_key?("us")
# puts countries.has_value?("amerika")
# puts countries.assoc("in")
# puts countries.rassoc("japan")

# newhash = countries.dup
# puts countries.eql?(newhash)
# puts countries.empty?
# countries.clear 
# countries.shift 

# var= countries.merge(data)
# puts var

# countries.each do 
#     |k,v| puts k ,v
# end

# Inheritance in ruby Alongwith  Method Overriding ,, use super method to access parents method in overriding

# class Parent
#     @@Total_Land= 10
#     def initialize(x,y)
#         @x,@y=x,y
#     end
#     def name
#         puts "name of the children are #{@x} and #{@y}"
#     end

# end
# class Another < Parent
#     @@ladies = 2
#     def initialize(a,b)
#         @a,@b = a,b 
#     end
#     def name
#         puts super()
#         puts @a+@b
#     end
# end 
#  obj = Another.new("Rahul" , "Shrishthi")
#  obj.name

# operator overloading

 
#distinct value of array
# c = [1,2,3,1,5,2,6,3,4] 
# uniq = []
# for i in c
#     if uniq.include?(i)== true
#         next
#     else
#         uniq.push(i)
#     end
# end
# print(uniq)

# finding dup and distinct at sinle time
# c = [1,2,3,1,5,2,6,3,4] 
# uniq = []
# for i in c
#     if uniq.include?(i)== true
#         puts i
#         next 
#     else
#         uniq.push(i) 
#     end
# end
# print(uniq)  

# fizzbuzz problem of hackerrank 
# for i in 1..15
#     if i%3==0 && i%5==0
#         puts "fizzbuzz"
#     elsif i%3==0
#         puts "fizz"
#     elsif i%5 == 0
#         puts "buzz"
#     else
#         puts i
#     end
# end

# find the factorila of a given number 
# def fact(n)
#     f=1
#     for i in 1..5
#         if n ==0
#             puts 0
#         elsif n< 0
#             puts "plz add positive value"
#         else
#             factorial = f*i
#             f=factorial

#             puts factorial
#         end
        
#     end  
# end
# fact(5) 


# #simple method of method overriding
# class Parent
#     def initialize(a,b)
#         @a,@b = a,b

#     end
#     def sum()
#         puts "sum of elemnets are #{@a+@b}"

#     end
# end
# class Children < Parent
#     def sum
#         super()
#         puts "multi of elements are #{@a*@b}"
#     end
# end 

#encapsulation in ruby is nothing but a simple 
#class and def methods so that no one can access para/attribute
#difference is that we are using getter/setter/ attr_accesor in previous class
# class Parent
#     def initialize(a,b)
#         @a,@b = a,b
#     end
#     def sum
#         puts "sum of elemnets are #{@a+@b}"  
#     end
# end
# class Children < Parent
#     def multi
        
#         puts "multi of elements are #{@a*@b}"

#     end
# end
# obj = Children.new(87,78)
# obj.multi()


# Abstraction is also very simple calling our method name in another method 
#following method is similar example for abstraction
#in the below Example we cant Access the Sum method directely
# class Parent
#     def initialize(a,b)
#         @a,@b = a,b
#     end
    #  private
#     def sum
#         puts "sum of elemnets are #{@a+@b}" 
#     end
# end
# class Children < Parent
    #    public 
#     def multi
        
#         puts "multi of elements are #{@a*@b}"
#         sum
#     end
# end
# obj = Children.new(87,78)
# obj.multi() 


#PROCS AND LAMBDA
# proc_object = Proc.new {|i| puts "am a akshay chavan #{i}"}
# puts proc_object.call(23)
# puts proc_object.lambda?

# c = lambda{puts "using lambda"}

# using & block 
#same cane be done by using Yield keyword
# def test(&b)
#     puts "hello akshay"
#     b.call
#     puts "block called before this"
# end
# v=test{puts "this is the block"}
# puts v.call  

# c = lambda{|v1,v2|puts "using lambda and sending para1 is #{v1} and para2 is #{v2}"}
# puts c.call(12,30)
# proc_obj = Proc.new{|k| puts "akshay \n"*k}
# puts proc_obj.call(5)

# abbove code can be written alsoas follow 
# puts proc_obj.(3)
#arity method shows how many arguments required
# proc_obj = Proc.new{|k,l| puts "akshay \n"*k}
# puts proc_obj.arity

#difference between procs and lambada

# the main diff between procs and lambda are arises between them in case of CONTRO FLOW KEYWORD
#     CONTROL FLOW KEYWORDS ARE : BREAK <REDO <RET
#     CONTROL FLOW KEYWORDS ARE : BREAK <REDO <RETuRN<NEXT,retry


# actually its not working here but in generally 
# after break and return stament in proc block it will eiits out of code without
# printing next satements but after using lambda it will 
#executes all methods after return and break statement

#  def sam() 
#     puts "first statement of this example"
#     v=Proc.new{puts "middle statement of this example"}
#     puts v.call
#     return
#     puts "last method of this example"
#  end
#  sam()
 
# def sam() 
#     puts "first statement of this example"
#     v=lambda{puts "middle statement of this example"}
#     puts v.call
#     return
#     puts "last method of this example"
#  end
#  sam()
 


# juggad for palindrome

# k= "kayhjak"
# v= []
# r=[]
# for m in 0...k.length
#     r.push(k[m])
#     v.unshift(k[m])
# end
# if v.eql?(r)
#     puts "palindrome"
# else
#     puts "not"
# end




#  The nerdy Developer
# Constants =
# PIE = 3.14
# puts PIE

#string
first_name = "akshay"
last_name = "chavan"


# fullname = first_name + last_name
# puts fullname

# fullname = first_name << last_name
# puts fullname

# string interpolation
# age = 26

# puts " The firstname is #{first_name} and age is #{age}"

# << symbol for concatenation of string
#  var = [ 1,2, 3 , 3 , 4]
#  var << 44
#  puts var
#  var = 'my name is akshay'
#  var<<'and my age is 26'
#  var << 'and am doing nothing'
#  puts var

 # manipulation of strings 
 #gsub  (Global Substitution)
#  puts var.gsub("akshay" , "khiladi")
# puts var +> This will return original string

# puts var.split(' ')
# code = "mon_abc"
# puts code.split("_")

#substring from original strings
# greet = "hello World"
# puts greet[0..3]
# puts greet[-1]
# puts greet.upcase
# puts greet.downcase
# puts greet.capitalize
# puts greet.reverse
# puts greet.include?("W")
# puts greet.start_with?("h")
# puts greet.end_with?("d")

#Immutability and Frozen String

# greet = "hello akshay"
# greet[0]= "f"
# puts greet

# so as you can see our string is mutable at default and nnow
# we are going to make it immutable byy frozen method

# greet = "hello akshay"
# greet.freeze
# greet[0] = "f"
# puts greet

# now aor string is immutable so its not possible to make it manipulate 
# one thimg notice that once the string is frozen it cant be unfrozen so ...

#object_id i.e internal id of an object i.e the exact memory location of the object

# greet = "hello akshay"
# greet_two = "hello akshay"
# puts greet.object_id
# puts greet_two.object_id

# in above example our memory location is different 

# greet = "hello akshay".freeze
# greet_two = "hello akshay".freeze
# puts greet.object_id
# puts greet_two.object_id

# now in above example our memory location is same for both the variables

# Array in Ruby 

# var = ["abc" , 'def' , 'xyz' , 'mno']
# puts var[0]
# puts var.first
# puts var.last
# puts var.first 3
# puts var.last 2

# for addition in array use 
# push , << , unshift .

# for delete from array use 
# pop , delete , shift .

# take methos is same like first 
# puts var.take(2)

# use insert method for add element at a specified location 
# var.insert(1 , "hello motto")
# puts var

#iterating over an array

# number = [ 1,2,41,52,63,5,8,9]
# number.each {|k| puts k+3}  or for same you can use 

# number.each do |k|
#     puts k-3
# end

#  for string use each_char 
# greet = " hello world"
# greet.each_char {|l| puts l}

# map 
# var = ["akshay" , "vijay" , "sanjay" , "aarya"]
# var.map {|h| puts h.upcase} 
#  number = [10,12,56,32,15,17,41]
#  number.select {|k| puts k%2==0}
#  number.map {|k| puts k%2==0}

# sample method
# puts number.sample

#concat of two array

# t = [32,68,9,14,3]

# puts t+number
#  puts t << number
# c = t.concat(number)
# puts c

# Splat operator 
# *a , b= 12,3,5,6,4,8
# puts a
# puts b

# a = [10,20,1,2,3,4,5,21]
# b = [5,6,10,7,9,20]
# c = a&b => this will return common element
# c = a|b  => this will exclude common element
# puts c

# Hash in ruby 
iteams = {}
iteams[:pen]= 10
iteams[:box]= 4
iteams[:laptop]= 5
iteams["smartphone"] = "readme"
# puts iteams => output = {:pen=>10, :box=>4, :laptop=>5, "smartphone"=>"readme"}
#iterate over hash
# iteams.each {|k,v| puts "#{k} : #{v}"}
# or 
# iteams.each do |k,v|
#     puts k
#     puts v
# end
# or anothe way to iterate hash 
# iteams.each_key {|k| puts k}
# iteams.each_value{|j| puts j}
# puts iteams.key?(:pen)
# puts iteams.value?(10)

# Exersise 
# var = "this is for practice"
# sample = {}
# var.each_char do |character|
#     if sample.key?(character)
#         sample[character] +=1
#     else
#         sample[character]= 1
#     end
# end
# puts sample

# fetch and merge methods 
# puts iteams.fetch(:pen)
# puts iteams.fetch("smartphone")

# dig method 
person = {
    details: {
        name: "akshay",
        age: 26 ,
        profession: "developer"
    }
}

# puts person[:details] [:name] 
# or you can use  
# puts person.dig(:details , :name) so this is dig method for you guys

# sample = {pen: 10 , pencil: 5 , laptop: 6}
# Another important method that is transform_values
# sample.transform_values{|j| puts "#{j*2} => do whatever u want with values  "}

# ranges 
# puts c = (0..5).to_a 
# puts c.class  

# step 

# random numbers 
# d = rand(1..10)
# s = [10,20,50,40,30]
# puts s.sample
# puts d

# Data Serilization  into csv and json means converting data into csv or json format

# suppose we are having a csv file like iteams.csv 
# id , name , age 
# 1 , akshay , 26
# 2 , vijay , 29 
# 3 , sanjay , 32

# require 'csv'
# puts CSV.read("app/iteams.csv" , headers: true)
# you will get same output as above 

# Json 
# require 'json'
# json_object = '{
#     'pen' : "25" ,
#         "pencil" : 20,
#     "laptop" : 5 }'

# var - JSON.parse(json_object)
# puts var

# above data is wrong but conver bacjk to json we will use 
# puts var.to_json
# require 'json'
# sample = {pen: 10 , pencil: 5 , laptop: 6}
# var = JSON.parse(sample)
# puts var

# this is not working now check later 
  #Now the most awaiting tutorials of classes in ruby


#   class Customer
#     @@customer_count = 0
#     def self.count
#         @@customer_count
#     end
#     def initialize(a,b)
#       @a,@b = a,b
#       puts @@customer_count += 1
#     end
#     def showdata
#         puts " #{@a}"
#     end

#   end
# customer_onne = Customer.new("akshay" , "aarush")
# customer_two = Customer.new("vijay" , "viraj")
# puts Customer.count
# puts customer_onne.showdata
# puts customer_two.showdata

# def initalze parameters i.e attributes of object are private 
# and we cant acces those attributes outside the class so to use them out of class we use 

# attr_reader = > to onlly read
# attr_write =>  to wrote only 
# attr_accessor => to both read and write  

# toprotect our data we are using controls on methos and those are 
# public 
# private and
# protected 

# private methods ca be only accessed by or inside of public or protected methods 
# and   protected methods can only accessed by instance of class 

# example 

# class Cube 
#     def initialize(a)
#         @a = a
#     end
#     def getarea
#         puts " area of the cube is #{@a*@a*@a}"
#     end
#     def getsize
#         puts "size of the cube is #{@a}"
#     end
#     private :getarea , :getsize
    #now we cant access these methods by instance
#     def printarea
#         area = getarea()
#         puts area
#     end
#     def printsize
#         size = getsize()
#         puts size
#     end
# end

#  obj1 = Cube.new(10)
#  obj1.getarea => this will  give an error 
# obj1.getsize => error 
# obj1.printsize
#  obj1.printarea

# Another important concept in ruby as inheritance 

# class A 
#     def do_something
#         puts " doing somthing .... dont worry ak"
#     end
#     def sing_a_song
#         puts " singing a songs "
#     end
# end

#  class B < A 
    # now u can access the methods of the class a with the instanse of class b
#     def walk
#         puts "walking ............."
#     end
#  end
#   obj1= B.new
#   obj1.do_something
#   obj1.sing_a_song
#   obj1.walk  

# Procs , Blocks , & Lambadas

# [1,2,3].each  { |n| puts n} 
# Yield keyword
#  def a
#     puts "inside A"
#     yield
#     puts " outside of a "
#  end

#  a{puts "hello world"}

# def example 
#     puts "start of the method"
#     yield 5 , 6
#     puts "end of the method"
# end
# example{|a,b| puts " multiplication of a and b is #{a*b} "}

# def print_2_time 
#     yield
#     yield
# end
# print_2_time{puts "hello world"}

# Lambda
# first = -> { puts " this is lambda "}
# first.call

# multiply_by_2 = -> (n) {n*2}
# s = multiply_by_2.call(4)
# puts s

# Proc in ruby 
# result = Proc.new do |a,b|
#     puts "inside the block"
#     sum = a+b
#     product = a*b
#     puts sum
#     puts product
# end

# result.call(2,5)

# b = Proc.new{|a,b| puts "multiplication of the para is #{a*b}"}
# b.call 4,5













 




































 










