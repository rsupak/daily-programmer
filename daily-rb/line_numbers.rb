def line_numbers(widths, str)
  str_widths = str.split('').map { |c| widths[c.ord - 'a'.ord] }
  str_len = str_widths.reduce(:+)
  current_width = str_widths.reduce(0) { |acc, w| acc + w > 100 ? w : acc + w }
  [str_len > 100 ? str_len / 100 + 1 : str_len, current_width] 
end

widths = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
str = "abcdefghijklmnopqrstuvwxyz"
# widths = [4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
# str = "bbbcccdddaaa"
p line_numbers(widths, str)
