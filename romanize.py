keys = { "M": 1000, "CM": 900, "D": 500, "CD": 400, "C": 100, "XC": 90, "L": 50, "XL": 40, "X": 10, "IX": 9, "V": 5, "IV": 4, "I": 1 }

roman_number = []
def romanize(num):
    if num < 1:
        return "".join(roman_number)
    else:
        for key in keys.keys():
            if num >= keys[key]:
                num -= keys[key]
                roman_number.append(key)
                return romanize(num)

print(romanize(int(input("Please enter a number to turn into Roman Numerals >> "))))




