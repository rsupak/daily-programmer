def palindrome?(number)
  return false if number < 0
  return true if number >= 0 && number < 10

  original_number = number
  reverse_number = 0
  expanded_number = []

  while number > 0
    expanded_number << number % 10
    number /= 10
  end

  expanded_number.each_index do |index|
    reverse_number += (expanded_number.reverse[index] * 10**index)
  end

  original_number == reverse_number
end

p palindrome?(123)
p palindrome?(121)
p palindrome?(1331)
