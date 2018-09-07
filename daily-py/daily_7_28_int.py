import re

delimiters = '+','-','*','/'
regexPattern = '|'.join(map(re.escape, delimiters))

operators_high = ['/', '*']
operators_low = ['+','-']


def operator_dict(operator, x, y):
    return {
        '+': lambda: x + y,
        '-': lambda: x - y,
        '*': lambda: x * y,
        '/': lambda: x / y,
    }.get(operator, lambda: None)()


def str_to_num(string):
    string.replace(' ', '')
    numbers_list = re.split(regexPattern, string)
    operator_list = []
    for char in string:
        if char in operators_high or char in operators_low:
            operator_list.append(char)
    temp_list = []
    for number in numbers_list:
        temp_list.append(number)
        if len(operator_list) > 0:
            temp_list.append(operator_list.pop(0))
        
    for i in range(len(temp_list)):
        try:
            temp_list[i] = int(temp_list[i])
        except:
            temp_list[i] = temp_list[i]
    return temp_list


def high_precedence(lst):
    # check list for high_precedence operators
    if operators_high[0] not in lst and operators_high[1] not in lst:
        return lst
    else:
        temp_list = []
        # iterate over list
        for i in range(len(lst)):
            # if i+1 = operator, perform operation, create new list, restart function
            if i+1 <= len(lst) and lst[i+1] in operators_high:
                new_num = operator_dict(lst[i+1], lst[i], lst[i+2])
                temp_list = lst[:i]
                temp_list.append(new_num)
                if i+3 < len(lst):
                    temp_list += lst[i+3:]
                lst = temp_list
                return high_precedence(lst)
                

def low_precedence(lst):
    # check list for low_precedence operators
    if operators_low[0] not in lst and operators_low[1] not in lst:
        return lst
    else:
        temp_list = []
        # iterate over list
        for i in range(len(lst)):
            # if i+1 = operator, perform operation, create new list, restart function
            if i+1 <= len(lst) and lst[i+1] in operators_low:
                new_num = operator_dict(lst[i+1], lst[i], lst[i+2])
                temp_list = lst[:i]
                temp_list.append(new_num)
                if i+3 < len(lst):
                    temp_list += lst[i+3:]
                lst = temp_list
                return low_precedence(lst)


def calculate(string):
    temp = str_to_num(string)
    new_temp = low_precedence(high_precedence(temp))
    answer = new_temp[0]
    if type(answer) == int:
        return '{}'.format(answer)
    elif type(answer) == float:
        return '{0:.3f}'.format(answer)


print(calculate('1+1')) # === 2
print(calculate(' 4 *2')) # === 8
print(calculate('2 + 3 * 5')) # === 17
print(calculate('1+2*3-4/2')) # === 5
print(calculate('1/8')) # === 0.125
print(calculate('1/12')) # === 0.0833
print(calculate('1+2*3/4+5*6/7')) # === 6.785

