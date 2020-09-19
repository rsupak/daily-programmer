# frozen_string_literal: true
def get_operation
  operations = [1, 2, 3, 4]
  operation = 0
  until operations.include?(operation)
    puts 'Please enter a number for the correct operation.'
    puts '1: Add'
    puts '2: Subtract'
    puts '3: Multiply'
    puts '4: Divide'
    operation = gets.to_i
  end
  operation
end

def get_opstring(operation)
  case (operation % 5)
  when 1
    ['adding', '+']
  when 2
    ['subtracting', '-']
  when 3
    ['multiplying', 'x']
  when 4
    ['dividing', '÷']
  end
end

def get_fraction
  input = gets.strip
  if input.include?(' ')
    number = input.split(' ')
  else
    number = [0, input]
  end
  whole_number = number[0]
  fraction = number[1].split('/')
  numerator = fraction[0]
  denominator = fraction[1]
  [input, whole_number, numerator, denominator]
end

def print_fraction(number)
  w = number[0].to_s
  n = number[1].to_s
  d = number[2].to_s
  return "#{n}/#{d}" if w.to_i.zero?
  "#{w} #{n}/#{d}"
end

def addition(num1, num2)
  sum = [
    num1[0] + num2[0],
    num1[1] + num2[1],
    num1[2]
  ]

  return sum unless sum[1] > sum[2]

  temp = sum[1] / sum[2]
  sum[0] += temp
  sum[1] %= sum[2]

  sum
end

operation = ''
op_string = []
responses = ['yes', 'y']
response = 'n'
until responses.include?(response)
  operation = get_operation
  op_string = get_opstring(operation)
  puts "We will be #{op_string[0]} fractions and/or mixed numbers."
  puts 'Is this correct?'
  response = gets.strip.downcase
end

puts 'Entering the first number:'
num1 = get_fraction
input1 = num1[0]
num1_array = num1[1..3]
p num1_array
puts
puts 'Entering the second number:'
num2 = get_fraction
input2 = num2[0]
p input2

# den1 = num1[2]
# den2 = num2[2]

# puts "#{print_fraction(num1)} #{op_string[1]} #{print_fraction(num2)} = #{print_fraction(addition(num1, num2))}"
# puts "The first number is #{whole1.zero? ? '' : whole1} #{num1}/#{den1}"

# print 'Enter the whole number of the second number (if 0 enter 0): '
# whole2 = gets.to_i
# print 'Enter the numerator of the second fraction: '
# num2 = gets.to_i
# print 'Enter the denominator of the second fraction: '
# den2 = gets.to_i

# puts "The second number is #{whole2.zero? ? '' : whole2} #{num2}/#{den2}"

# whole_sum = case operation
#               when 1
#                 whole1 + whole2
#               when 2
#                 whole1 - whole2
#               end

# num_sum = case operation
#             when 1
#               num1 + num2
#             when 2
#               num1 - num2
#             end
# den_sum = den1

# if num_sum >= den_sum
#   whole_sum = whole_sum + num_sum / den_sum
#   num_sum %= den_sum
# end

# print 'The solution is '
# if num_sum.zero? && !whole_sum.zero?
#   puts whole_sum
# else
#   "#{whole_sum.zero? ? '' : whole_sum} #{num_sum}/#{den_sum}"
# end
