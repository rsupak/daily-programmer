def t_oz(lbs):
    return lbs * 14.583

def getWorthYourWeightInGold(lbs):
    troy_value = 1321.10
    return t_oz(lbs) * troy_value / 1e6

weight = int(input("Please enter your weight: "))
print("You're worth {:.1f} Million".format(getWorthYourWeightInGold(weight)))
