def reverse_ss(str)
  return str unless str.include?('(')

  start = 0
  y = str.index(')')
  start += 1 while str[start...y].include?('(')
  str = str[0...start - 1] + str[start...y].reverse + str[y + 1...str.length]
  reverse_ss(str)
end

# str = "(abcdefghijkl(mno)p)q"
str = "(u(love)i)"
p reverse_ss(str)
