from collections import OrderedDict

roman_numbers = OrderedDict()
roman_numbers['M'] = 1000
roman_numbers['CM'] = 900
roman_numbers['D'] = 500
roman_numbers['CD'] = 400
roman_numbers['C'] = 100
roman_numbers['XC'] = 90
roman_numbers['L'] = 50
roman_numbers['XL'] = 40
roman_numbers['X'] = 10
roman_numbers['IX'] = 9
roman_numbers['V'] = 5
roman_numbers['IV'] = 4
roman_numbers['I'] = 1


numerals = []
def romanize(num):
    if num < 1:
        return "".join(numerals)
    else:
        for key in roman_numbers.keys():
            if num >= roman_numbers[key]:
                num -= roman_numbers[key]
                numerals.append(key)
                return romanize(num)

num = int(input("Please enter a number: "))
print(romanize(num))
