-- defines a factorial function
function factorial (num)
  if num == 0 then
    return 1
  else
    return num * factorial(num - 1)
  end
end

print("Enter a number")
input = io.read("*num")  -- reads a number
print(factorial(input))
