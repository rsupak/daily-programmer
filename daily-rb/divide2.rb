def divide2(dividend, divisor)
  sign = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0) ? -1 : 1
  quotient = 0
  dividend, divisor = dividend.abs, divisor.abs
  while dividend >= divisor
    dividend -= divisor
    quotient += 1
  end
  quotient * sign
end

p divide2(12, 4)
p divide2(6, -3)
