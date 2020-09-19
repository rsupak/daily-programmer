require 'byebug'

def count_and_say(step)
  return 1 if step == 1

  spoken_numbers = []
  current_char = nil
  count = 0
  previous_result = count_and_say(step - 1).to_s.split('')

  previous_result.each do |char|
    current_char ||= char
    count += 1 if char == current_char
    next if char == current_char

    spoken_numbers << [count.to_s, current_char] 
    count = 1
    current_char = char
  end

  spoken_numbers << [count.to_s, current_char]
  spoken_numbers.join('').to_i
end

p count_and_say(5)
