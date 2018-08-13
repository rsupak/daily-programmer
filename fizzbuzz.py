def fizzbuzz(low, high):
    for num in range(low, high):
        temp = ""
        if num % 3 == 0:
            temp += 'Fizz'
        if num % 5 == 0:
            temp += 'Buzz'
        if temp == "":
            temp = num
        print(temp)

# user input for low end of the range
low = int(input("Min: "))

# user input for high end of the range
high = int(input("Max: "))

fizzbuzz(low, high)