def is_balanced(string):
    left_braces = ["[","{","("]
    right_braces = ["]","}",")"]
    left = 0
    right = 0
    for letter in string:
        if letter in left_braces:
            left += 1
        elif letter in right_braces:
            right += 1

    return left == right

test = '{(1[2]3)4}'
x = is_balanced(test)
print(x)