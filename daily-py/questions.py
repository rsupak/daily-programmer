from random import randint

basics_1_1 = {
    'vir' : 'man',
    'femina' : 'woman',
    'ego' : 'I',
    'sum' : 'I am',
    'puer' : 'boy',
    'puella': 'girl'
}

basics_1_2 = {
    'ille' : 'he',
    'illa' : 'she',
    'consumis' : 'you eat',
    'tu' : 'you',
    'es' : 'you are',
    'est' : 'is'
}

basics_1_3 = {
    'panis' : 'bread',
    'aqua' : 'water',
    'lacte' : 'milk',
    'consumo' : 'I eat',
    'consumit' : 'eats',
    'bibo' : 'I drink',
    'bibis' : 'you drink',
    'bibit' : 'drinks'
}
practice_times = int(input("How many times do you wish to practice?\n>"))
count = 1
while count <= practice_times:
    count += 1
    for i in basics_1_1.keys():
        print(f"Quid significat {i}?")
        answer = ''
        while answer != basics_1_1[i]:
            answer = input("> ")
            if answer == basics_1_1[i]:
                print("Great Job! You got it!")
                break
            else:
                print("Incorrect! Try again!")

    for i in basics_1_2.keys():
        print(f"Quid significat {i}?")
        answer = ''
        while answer != basics_1_2[i]:
            answer = input("> ")
            if answer == basics_1_2[i]:
                print("Great Job! You got it!")
                break
            else:
                print("Incorrect! Try again!")

        # (f"Quid significat ", basics_1_1.keys()[i])
        # answer = input("> ")
        # if (answer == basics_1_1[word]):
        #     print("Correct!")
        # else:
        #     print("I'm sorry, that is not the correct answer.")
        #     print(f"The correct answer is {definition}", basics_1_1[word])
