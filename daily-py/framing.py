def word_and_filler(word, max_len):
    filler = 0
    if len(word) < max_len:
        filler = max_len - len(word)
    return f'* {word} {" " * filler}*'

def framing(obj):

    if isinstance(obj, str):
    # take in a string and separate
        obj = obj.split(' ')

    # find max_word_length
    max_word_length = 0
    for word in obj:
        max_word_length = len(word) if len(word) > max_word_length else max_word_length

    # open frame
    # print * line = max_word_length + 4
    print(f'{"*" * (max_word_length + 4)}')

    # print * + space + word + filler_space + space +  *
    for word in obj:
        print(word_and_filler(word, max_word_length))
    
    #close frame
    print(f'{"*" * (max_word_length + 4)}')

framing("Have a nice day")
framing(['What','a','wonderful','world'])