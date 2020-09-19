
def get_fibonacci(high, fib_list = [0,1], even_sum = 0):
    if fib_list[1] >= high:
        return even_sum
    else:
        new_num = fib_list[0] + fib_list[1]
        if new_num % 2 == 0:
            even_sum += new_num
        fib_list[0],fib_list[1] = fib_list[1],new_num
        return get_fibonacci(high, fib_list, even_sum)

print(get_fibonacci(8))
