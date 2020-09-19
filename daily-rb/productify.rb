# def productify(input)
#   products = input.map { 1 }
#   current = 1
#   (0..input.length - 1).each do |idx|
#     products[idx] *= current
#     current *= input[idx]
#   end
#   current = 1
#   (input.length - 1).downto(0).each do |idx|
#     products[idx] *= current
#     current *= input[idx]
#   end
#   products
# end

# p productify([2,3,6,4])

def productify(input)
  temp = input.dup
  product = input.reduce(&:*)
  input.each_index do |i|
    input[i].delete_at(i)
  end

end

p productify([2, 3, 6])

