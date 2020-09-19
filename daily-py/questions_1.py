from random import randint

basics_1_1_words = ['vir', 'femina', 'ego', 'sum', 'puer', 'puella']
basics_1_1_defs = ['man', 'woman', 'I', 'I am', 'boy', 'girl']

points = 0
again = ''
current_words = []

for i in basics_1_1_words:
    print("Hello")
    
while again != 'n':
    i = randint(0, len(basics_1_1_words) - 1)
    print(f"Quid significat {basics_1_1_words[i]}?")
    answer = ''
    while answer != basics_1_1_defs[i]:
        answer = input("> ")
        if answer == basics_1_1_defs[i]:
            print("Great Job! You got it!")
            break
        else:
            print("Incorrect! Try again!")

    again = input("Do you want to continue?\n>")

print("Success!")
