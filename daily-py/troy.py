import warnings
warnings.filterwarnings(action="ignore")

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

def statistic(column):
    print('statistic operation on column..')

    print('count')
    print('mean')
    print('standard deviation')
    print('min')
    print('max')
    print('histogram')
    # number of observations/points
    print('count')
    n = np.size(column)
    print(n)
    # mean of Age
    print('mean')
    m_column = np.mean(column)
    print(m_column)
    # min of AGe
    print('min')
    column_min = np.min(column)
    print(column_min)

    # max of Age
    print('max')
    column_max = np.max(column)
    print(column_max)
    # histogram
    print('histogram')
    plt.hist(column, bins=10)
    plt.show()


def get_data(file_name):
    dataframe = pd.read_csv(file_name)
    print(dataframe)
    x = []
    y = []
    z = []
    w = []
    v= []
    for Age, BEDRMS, BUILT, ROOM, UTILITY in zip(
        dataframe['AGE'], dataframe['BEDRMS'],dataframe['BUILT'],dataframe['ROOMS'],dataframe['UTILITY']):
        x.append(Age)
        y.append(BEDRMS)
        z.append(BUILT)
        w.append(ROOM)
        v.append(UTILITY)
    return x,y,z,w,v

if __name__ == "__main__":

    print("***Welcome to  python data analysis App*** \n")

    Age, BEDRMS, BUILT, ROOM, UTILITY = get_data('housing1.csv')

    # infinte while loop

    while True:

     print("Select the file you want to analyse:-\n")
     print("1. Population data")
     print("2. Housing data")
     print("3. Exit the program")
     # take input from user
     p = int(input("Enter a choice : "))
     if p == 1:
        print("You have selected population data:  ")
        print("1. Pop Apr 1")
        print("2. Pop Jul 1")
        print("3. ChangePop")
        print("4.  Exit column")
        q = int(input("Select the column you want to analyse : "))
        if q == 1:
         print('to be work out..')
        elif q == 2:
         print('to be work out')
     elif p == 2:
         print("You have selected housing data:  \n")
         print("1. Age")
         print("2. BEDRMS")
         print("3. BUILT")
         print("4. ROOM")
         print("5. UTILITY")
         print("6.  Exit column")

         q = int(input("Select the column you want to analyse : "))
         if q == 1:
             statistic(Age)
         elif q == 2:
             statistic(BEDRMS)
     elif p == 3:
        print("Exit Program ")
        break
