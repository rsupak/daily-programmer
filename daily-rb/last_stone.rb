def last_stone(stones)
  return 0 if stones.empty?
  return stones.first if stones.size == 1 # could have used arr[0] here...

  stones.sort!
  temp = stones.pop(2).reduce(:-).abs # simple reduce syntax, love it!
  stones << temp unless temp.zero?
  last_stone(stones)
end

p last_stone([2, 7, 4, 1, 8, 1])
p last_stone([2, 4, 1, 1, 1])
p last_stone([2, 1, 1])
