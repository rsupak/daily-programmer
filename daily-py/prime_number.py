from math import sqrt

def is_prime(num):
    if num < 2:
        return False
    else:
        if num <= 3:
            return True
        elif num % 2 == 0 or num % 3 == 0:
            return False
        else:
            i = 5   # start test index at 5 because all less is already parsed
            while i < sqrt(num):
                if num % i == 0:
                    return False
                i += 1
            return True
                
print(is_prime(5))
print(is_prime(7))
print(is_prime(9))
print(is_prime(21))
print(is_prime(17))
