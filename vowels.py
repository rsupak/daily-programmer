VOWELS = ['a','e','i','o','u']

str_arr = ["abcd", "eikr", "oufj"]
temp_arr = []
for i in range(len(str_arr)):
    for j in range(len(str_arr[i])):
        if str_arr[i][j] in VOWELS:
            if str_arr[i][j+1] in VOWELS:
                temp_arr.append(str_arr[i][j] + str_arr[i][j+1])
            if str_arr[i+1][j] in VOWELS:
                if str_arr[i+1][j+1] in VOWELS:
                    temp_arr.append(str_arr[i+1][j] + str_arr[i+1][j+1])
                    break
            else:
                break
    
            
if temp_arr != []:
    print(temp_arr)
else:
    print(-1)
    
