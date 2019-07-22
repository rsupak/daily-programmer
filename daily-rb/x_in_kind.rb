def x_of_a_kind(arr)
  card_hash = Hash.new { |hash, key| hash[key] = 0 }
  arr.each { |num| card_hash[num] += 1 }
  card_hash.values.all? { |x| (x % card_hash.values.min).zero? }
end

p x_of_a_kind([1, 1, 2, 3, 3, 2, 2])
