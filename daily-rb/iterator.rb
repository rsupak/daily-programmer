 def fib(n)
  return 1 if n <= 2

  fib_index = 3
  a, b = 1, 1

  while fib_index <= n
    c = a + b
    a = b
    b = c
    fib_index += 1
  end

  c
end

p fib(5)

require 'generator'

# # Generator from an Enumerable object
# g = Generator.new(['A', 'B', 'C', 'Z'])

# while g.next?
#   puts g.next
# end
