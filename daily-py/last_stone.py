
def last_stone(stones):
  if len(stones) == 0: return 0
  if len(stones) == 1: return stones[0]

  stones.sort()
  temp = abs(stones.pop() - stones.pop())
  if temp > 0: stones.append(temp)
  return last_stone(stones)

print(last_stone([2, 7, 4, 1, 8, 1]))
