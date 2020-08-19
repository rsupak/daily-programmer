# def alt_map(arr, prc1, prc2)
#   arr.map.with_index do |ele, i|
#     i.even? ? prc1.call(ele) : prc2.call(ele)
#   end
# end

# half = Proc.new { |n| n / 2.0 }
# times_thousand = Proc.new { |n| n * 1000 }

# p alt_map([1,10,4,7,5], half, times_thousand)
require 'byebug'
def prime?(num)
  return false if num < 2

  (2...num).each do |fact|
    p fact
    return false if (num % fact).zero?
  end
  true
end

p prime?(12)
