# n = highest number in range
def perfect_number_range(n)
  perfects = []
  (1..n).each do |num|
    perfects << num if perfect_number?(num)
  end
  perfects
end

# test whether or not num is a perfect number
def perfect_number?(num)
  factorize(num).sum == num
end

# returns array of factors exclusive of num
def factorize(num)
  factors = []
  (1...Math.sqrt(num)).each do |fact|
    if (num % fact).zero?
      factors << fact
      factors << num / fact unless num / fact == num
    end
  end
  factors
end

p perfect_number_range(1000) # => [6, 28, 496]
