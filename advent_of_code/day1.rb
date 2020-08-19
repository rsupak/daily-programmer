file = File.open("day1.txt")
data = file.readlines.map(&:chomp!).map(&:to_i)

fuel_cost = 0
data.map do |num|
  total = 0
  until num <= 0 do
    num = num / 3 - 2
    total += num unless num <= 0
  end
  fuel_cost += total
end

p fuel_cost
