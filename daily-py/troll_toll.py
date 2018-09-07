def troll_toll(cakes = 1, trolls = 7):
    if cakes == 2 and trolls == 0:
        return f"You will end with {cakes} cakes!"
    elif cakes < 2 and trolls == 0:
        print(f"You will end with {cakes} cakes!")
        cakes += 1
        return troll_toll(cakes, trolls = 7)
    else:
        if trolls == 7:
            starting_cakes = cakes
            print(f'If you start with {starting_cakes}...')
        cakes //= 2
        trolls -= 1
        cakes += 1
        return troll_toll(cakes, trolls)

print(troll_toll())