require "byebug"

def fuzz_buzz(num)
  debugger
  numbers = []
  (1..num).each do |i|
    if i % 3 != 0 || i % 5 != 0
      numbers << 1
    end
  end
  numbers
end

p fuzz_buzz(10)
