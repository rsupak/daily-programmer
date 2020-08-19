# TEST = "test"
# size = 6

# hash = TEST.chars.map(&:ord).reduce(:+) % size

# p hash

# BUCKETS = 6

# test_hash = {
#   "A New Hope" => "Average", 
#   "Empire Strikes Back" => "Excellent",
#   "Return of the Jedi" => "The Best"
# }

# def hash(input)
#   input.to_s.chars.inject(0) { |sum, ch| sum + ch.ord } % BUCKETS
# end

# def hash2(input)
#   input.to_s.chars.map(&:ord).reduce(:+) % BUCKETS
# end

# x = hash('hello')
# y = hash('hello')
# puts "x: #{x}"
# puts "y: #{y}"

# table = Array.new(BUCKETS) { 0 }
# index_array = test_hash.keys

# index_array.each do |input|
#   table[hash(input)] = test_hash[input]
# end

# p table
