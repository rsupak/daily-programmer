board = Array.new(3) { Array.new(3) { Array.new(3) { Array.new(3) { [] } } } }

board.each do |block|
  block.each do |inner|
    p inner
  end
end
