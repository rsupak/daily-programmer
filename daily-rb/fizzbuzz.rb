def fizzbuzz(limit)
  threes = []
  fives = []
  (1..limit).each do |num|
    threes << num * 3 if num * 3 <= limit
    fives << num * 5 if num * 5 <= limit
  end
  (1..limit).each do |num|
    puts num unless (threes | fives).include?(num)
    puts 'fizz' if (threes - fives).include?(num)
    puts 'buzz' if (fives - threes).include?(num)
    puts 'fizzbuzz' if (threes & fives).include?(num)
  end
end

fizzbuzz(100)
