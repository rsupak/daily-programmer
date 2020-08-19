def count_trailing_zeros(num)
  return 0 if num.zero?
  num / 5 + count_trailing_zeros(num / 5)
end

p count_trailing_zeros(923451532842)

# hmm….ultimately the zeros for each factorial increase based on the number 
# of 5's in the prime factorization of the number. 
# there exist no numbers with trailing zero’s < 5! 
# 1! = 1          # 1! has no prime factors
# 2! = 2          # (2)
# 3! = 6          # (2, 3)
# 4! = 24         # (2, 2, 2, 3)
# 5! = 120        # (2, 2, 2, 3, 5)
# 6! = 720        # (2, 2, 2, 2, 3, 3, 5)
# 10! = 3628800   # (2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 5, 5, 7)

# as such the 5's can be counted by calculating how many multiples 5 
# the factorial number can be floor divided by

# 1 / 5 = 0
# 2 / 5 = 0
# 5 / 5 = 1
# 10 / 5 = 2
# 20 / 5 = 4
# 25 / 5 = 5 / 5 = 1 (5 + 1 = 6)



