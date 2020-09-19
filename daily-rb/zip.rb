# class Array
#   def my_zip(*arrs)
#     len = ([self, *arrs]).map { |arr| arr.size }.max
#     out_arr = []
#     len.times do |i|
#       new_arr = []
#       new_arr << self[i]
#       arrs.each do |arr|
#         new_arr << arr[i]
#       end
#       out_arr << new_arr
#     end
#     out_arr
#   end
# end

# a = [1,2,3]
# b = ['a','b','c', 'd']
# c = [4,5,6]

# p a.my_zip(b, c)
# p a.my_zip(b, c)

def zip(fn, *args)
  out_arr = []
  args.first.size.times do |i|
    in_arr = []
    args.each do |a|
      in_arr <<  a[i]
    end
    out_arr << fn.call(in_arr)
  end
  out_arr
end

a = [1,2,3]
b = [4,5,6]
c = [7,8,9]

def sum
  -> (arr) { arr.reduce(&:+) }
end

p zip(-> (arr) { arr.reduce(&:+) }, a, b, c)

def zip_longest(default, fn, *args)
  len = args.map(&:size).max
  out_arr = []
  len.times do |i|
    in_arr = []
    args.each do |a|
      in_arr << (a[i].nil? ? default : a[i])
    end
    p in_arr
    out_arr << fn.call(in_arr)
  end
  out_arr
end

a = [0,1,2,3]
b = [4,5,6]
c = [7,8,9]

p zip_longest(0, sum, a, b, c)
