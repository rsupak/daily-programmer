# class Person
#   attr_accessor :age
#   def initialize(initialAge)
#     if initialAge <= 0
#       puts 'Age is not valid, setting age to 0.'
#       @age = 0
#     else
#       @age = initialAge
#     end
#   end

#   def amIOld()
#     puts 'You are young.' if @age < 13
#     puts 'You are a teenager.' if @age < 18
#     puts 'You are old.'
#   end

#   def yearPasses()
#     @age += 1
#   end
# end

# T=gets.to_i
# for i in (1..T)do
#     age=gets.to_i
#     p=Person.new(age)
#     p.amIOld()
#     for j in (1..3)do
#         p.yearPasses()
#     end
#     p.amIOld
#   	puts ""
# end      

# T = gets.to_i
# string_array = []
# (0...T).each do |i|
#   string_array << gets.strip
# end

# string_array.each do |word|
#   str1, str2 = '', ''
#   word.each_char.with_index do |char, idx|
#     (idx % 2).zero? ? str1 += char : str2 += char
#   end
#   puts "#{str1} #{str2}"
# end

# Enter your code here. Read input from STDIN. Print output to STDOUT

# n = gets.to_i
# phone_book = {}
# puts "enter name"
# n.times do 
#   entry = gets.split(' ')
#   phone_book[entry[0]] = entry[1]
# end
# puts "queries"
# names = []
# loop do
#   puts 'Enter a name'
#   name = gets.strip
#   break if name == ''

#   names << name
# end

# names.each do |name|
#   puts "#{name}=#{phone_book[name]}"
# end
# def count_ones(str)
#   max_count = 0
#   count = 0
#   str.each_char do |char|
#     if char == '1'
#       count += 1
#     elsif char == '0'
#       max_count = count if count > max_count
#       count = 0
#     end
#   end
#   max_count.zero? || max_count <= count ? count : max_count
# end

# puts count_ones("%b" % 951)

# def max_hourglass(arr)
#   max = -Float::INFINITY
#   (0..3).each do |i|
#     (0..3).each do |j|
#       sum = arr[i][j] + arr[i][j + 1] + arr[i][j + 2] +
#             arr[i + 1][j + 1] + arr[i + 2][j] +
#             arr[i + 2][j + 1] + arr[i + 2][j + 2]
#       max = sum if sum >= max
#     end
#   end
#   max
# end
# arr = [[-1, -1, 0, -9, -2, -2], [-2, -1, -6, -8, -2, -5], [-1, -1, -1, -2, -3, -4],
#        [-1, -9, -2, -4, -4, -5], [-7, -3, -3, -2, -9, -9], [-1, -3, -1, -2, -4, -5]]
# p max_hourglass(arr)

# class Person
# 	def initialize(firstName, lastName, id)
# 		@firstName = firstName
# 		@lastName = lastName
# 		@id = id
# 	end
# 	def printPerson()
# 		print("Name: ",@lastName , ", " + @firstName ,"\nID: " , @id)
# 	end
# end

# class Student < Person
#     def initialize(scores)
#       @scores = scores
#     end

#     def calculate()
#       avg = @scores.reduce(:+) / @scores.size.to_f
#       return 'O' if avg <= 100 && avg >= 90
#       return 'E' if avg < 90 && avg >= 80
#       return 'A' if avg < 80 && avg >= 70
#       return 'P' if avg < 70 && avg >= 55
#       return 'D' if avg < 55 && avg >= 40
#       return 'T' if avg < 40
#     end
# end

# input = gets.split()
# firstName = input[0]
# lastName = input[1]
# id = input[2].to_i
# numScores = gets.to_i
# scores = gets.strip().split().map!(&:to_i)
# s = Student.new(firstName, lastName, id, scores)
# s.printPerson           
# print("\nGrade: " + s.calculate)

# def convert_temp(temp, **args)
#   if args[:input_scale] == 'celsius'
#     return (temp + 273.15).round(2) if args[:output_scale] == 'kelvin'
#     return (temp * 9 / 5.0 + 32).round(2) if args[:output_scale] == 'fahrenheit'
#     return temp.round(2) if args[:output_scale] == 'celsius'
#   elsif args[:input_scale] == 'fahrenheit'
#     convert_temp((temp - 32) * 5 / 9.0, input_scale: 'celsius', output_scale: args[:output_scale])
#   elsif args[:input_scale] == 'kelvin'
#     convert_temp((temp - 273.15), input_scale: 'celsius', output_scale: args[:output_scale])
#   end
# end

# p convert_temp(0, :input_scale=>"fahrenheit", :output_scale=>"celsius")
# p convert_temp(393, :input_scale=>"kelvin", :output_scale=>"celsius")
# p convert_temp(400, :input_scale=>"fahrenheit", :output_scale=>"celsius")
# p convert_temp(333, :input_scale=>"fahrenheit", :output_scale=>"kelvin")
# p convert_temp(celsius, :input_scale=>"celsius", :output_scale=>"celsius")

# power_function = -> (x, z) {
#     (x) ** z
# }

# base = gets.to_i
# raise_to_power = -> (z) {
#   x
# }

# power = gets.to_i
# puts raise_to_power.(power)


# power_array = -> (power, array_size) do 
#     1.upto(Float::INFINITY).lazy.map { |x| x**power }.first(array_size) 
# end

# p power_array.(2,4)
# array_size = gets.strip.to_i

# def prime?(num)
#   prime = true
#   (2...num).each do |fact|
#     prime = false if (num % fact).zero?
#   end
#   true
# end

# palin_primes = -> (array_size) do
#   2.upto(Float::INFINITY).lazy.select do |num|
#     next unless num.to_s == num.to_s.reverse

#     prime = true
#     (2...num).each do |fact|
#       prime = false if (num % fact).zero?
#     end
#     next if prime == false
    
#     num
#   end.first(array_size)
# end

# p palin_primes.(array_size)
# 65 - 90, 97 - 122 AZaz
# def rot13(secret_messages)
#   secret_messages.map do |msg|
#     msg.split(' ').map do |word|
#       word.split('').map do |char|
#         char.ord - 13 < 'a'.ord ? ('z'.ord + char.ord - 13 - 'a'.ord + 1).chr : (char.ord - 13).chr
#       end.join('')
#     end.join(' ')
#   end
# end

# secrets = ["qrygn", "zrrg ng pubpbyngr pbeare", "gra zra", "gjb onpxhc grnzf", "zvqavtug rkgenpgvba"]

# p rot13(secrets)

# def rot(msg)
#   msg.split('').map do |c|
#     c.ord - 13 < 'a'.ord ? ('z'.ord + c.ord - 13 - 'a'.ord + 1).chr : (c.ord - 13).chr
#   end.join('')
# end

# p rot('qrygn')

def func_any(hash)
    # Check and return true if any key object within the hash is of the type Integer
    # If not found, return false.
    hash.keys.any? { |key| key.is_a? Integer}
end

def func_all(hash)
    # Check and return true if all the values within the hash are Integers and are < 10
    # If not all values satisfy this, return false.
    hash.keys.all? { |key| key.is_a?(Integer) && key < 10}
end

def func_none(hash)
    # Check and return true if none of the values within the hash are nil
    # If any value contains nil, return false.
    hash.values.none? { |value| value.nil? }
end

def func_find(hash)
    # Check and return the first object that satisfies either of the following properties:
    #   1. There is a [key, value] pair where the key and value are both Integers and the value is < 20 
    #   2. There is a [key, value] pair where the key and value are both Strings and the value starts with `a`.
    hash.find do |key, value| 
      key.is_a?(Integer) && value.is_a?(Integer) && value < 20 ||
      key.is_a?(String) && value.is_a?(String) && value.split('').first == 'a'
    end
end
# p func_any({1=>1, 2=>4, 13=>6})
# p func_all({1=>1, 2=>4, 13=>6})
# p func_none({1=>1, 2=>4, 13=>6})
# p func_find({1=>21, 2=>43, 13=>62, 'hope'=>'alpha'})

class Node
  attr_accessor :data, :next
  
  def initialize data
    @data = data
    @next = nil
  end
end

class Solution

  def insert(head, value)
    return Node.new(value) if head.nil?

    current = head
    current = current.next until current.next.nil?
    current.next = Node.new(value)
    head
  end

  def display(head)
    current = head
    while current
      print "#{current.data} "
      current = current.next
    end
  end
end

mylist = Solution.new
head = nil
nums = [1,2,3,4,5]

nums.each do |num|
  p head
  head = mylist.insert(head, num)
end

mylist.display(head)
