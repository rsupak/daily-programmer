class MovingAverage
  attr_accessor :nums

  def initialize(max_size)
    @max_size = max_size
    @nums = []
  end

  def next(num)
    @nums.shift if @nums.size == @max_size
    @nums << num
    p @nums
    puts @nums.sum / @nums.size
  end
end

m = MovingAverage.new(3)

m.next(1) #=> 1
m.next(10) #=> 5
m.next(3) #=> 4
m.next(5) #=> 6
