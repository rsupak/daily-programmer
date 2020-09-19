def shift_string(str, shifts)
  shifts.each { |shift| shift[0].zero? ? shift[1].times { str = str[1..-1] + str[0] } : shift[1].times { str = str[-1] + str[0...-1] } }; return str
end

p shift_string('abcdefg', [[1,1],[1,1],[0,2],[1,3]])
