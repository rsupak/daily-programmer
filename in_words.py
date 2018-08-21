from collections import OrderedDict
from math import floor


def make_word_dict(num):
    word_def = {
        'trillion' : 1e12,
        'billion' : 1e9,
        'million' : 1e6,
        'thousand' : 1e3,
        'hundred' : 100,
        'ten' : 10,
        'one' : 1,
    }

    word_list = [('trillion',0), ('billion',0), ('million',0),
                ('thousand',0), ('hundred',0), ('ten',0), ('one',0)]

    word_dict = OrderedDict(word_list)

    for key in word_dict.keys():
        word_dict[key] = 0

    for key in word_dict.keys():
        word_dict[key] = floor(num // word_def[key])
        num %= word_def[key]

    return word_dict


def name_singles(num):
    single_digits = {
        1: 'one',
        2: 'two',
        3: 'three',
        4: 'four',
        5: 'five',
        6: 'six',
        7: 'seven',
        8: 'eight',
        9: 'nine',
    }

    return single_digits[num]


def name_teens(num):
    teens = {
        10: 'ten',
        11: 'eleven',
        12: 'twelve',
        13: 'thirteen',
        14: 'fourteen',
        15: 'fifteen',
        16: 'sixteen',
        17: 'seventeen',
        18: 'eighteen',
        19: 'nineteen'
    }

    return teens[num]


def name_tens(num):
    tens = {
        9: 'ninety',
        8: 'eighty',
        7: 'seventy',
        6: 'sixty',
        5: 'fifty',
        4: 'forty',
        3: 'thirty',
        2: 'twenty'
    }

    return tens[num]


def name_hundreds(num):
    temp_dict = make_word_dict(num)
    temp_word = ""
    for key, value in temp_dict.items():
        if value:
            if key == 'one':
                    if temp_dict['ten'] == 0 and temp_dict['one'] > 9:
                        temp_word += name_teens(value)
                    else:
                        temp_word += name_singles(value)
            elif key == 'ten' and temp_dict['ten'] == 1:
                temp_dict['one'] += 10
                temp_dict['ten'] -= 1
            elif key == 'ten' and temp_dict['ten'] > 1:
                temp_word += '{}-'.format(name_tens(temp_dict['ten']))
            elif key == 'hundred':
                temp_word += "{} {} ".format(name_singles(value), key)
        
    return temp_word

def make_word(num):
    word = ""
    word_dict = make_word_dict(num)
    for key, value in word_dict.items():
        if value:
            if key != 'one' and key != 'ten' and key != 'hundred':
                temp_word = name_hundreds(value)
                word += temp_word + " " + key + " "
            elif key == 'hundred':
                word += "{} {} ".format(name_singles(value), key)
            elif key == 'ten' and word_dict['ten'] == 1:
                word_dict['one'] += 10
                word_dict['ten'] -= 1
            elif key == 'ten' and word_dict['ten'] > 1:
                word += '{}-'.format(name_tens(word_dict['ten']))
            elif key == 'one':
                    if word_dict['ten'] == 0 and word_dict['one'] > 9:
                        word += name_teens(value)
                    else:
                        word += name_singles(value)
            
    return word

x = make_word(99999125)
print(x)