input1 = '192.168.1.1'
input2 = '192.168.2.14'

input1_arr = input1.split('.').map(&:to_i)
input2_arr = input2.split('.').map(&:to_i)
p input1_arr
p input2_arr

result_arr = []
(0..3).each do |i|
  result_arr << (input1_arr[i] - input2_arr[i]).abs
end

p result_arr
new_arr = []
result_arr = result_arr.reverse
result_arr.reverse.each_index do |i|
  new_arr << result_arr[i] * (256**i)
end
p new_arr.sum
