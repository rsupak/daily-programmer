class TwoSum
  def initialize
    @nums = Hash.new { |hash, key| hash[key] = 0 }
  end

  def add(num)
    @nums[num] += 1
  end

  def find(num)
    @nums.each do |key, value|
      b = num - key
      return true if key == b && value > 1
      return true if key != b && @nums.keys.include?(b)
    end
    false
  end
end

two_sum = TwoSum.new
two_sum.add(1)
two_sum.add(3)
p two_sum.find(4)
p two_sum.find(6)
