# node: 4
# node:1 --- node:3
# node:1 --- node:1 --- node:2
# node:1 --- node:1 --- node:1 --- node:1
# node:2 --- node:1 --- node:1
# node:2 --- node:2
# node:3 --- node:1

# num = 4
# coins = [1,2,3]

# def find_reps(nums, coins):
#     sol_list = []
#     for coin in coins:
#         temp_list = []
#         if num % coin == 0:
#             count = num/coin
#             while count > 0:
#                 temp_list.append(coin)
#                 count -= 1
#             sol_list.append(temp_list)
#     return sol_list

# temp = coins.pop()
# for coin in coins:
#     temp_list = [temp]
#     if num - temp - coin >= 0:
#         while num - temp - coin >= 0:
#             temp_list.append(coin)
#             num -= temp + coin
#         sol_list.append(temp_list)
        
    

# print(find_reps(num, coins))

def count(S,m,n):
    if n == 0:
        return 1
    if n < 0:
        return 0
    if m <= 0 and n >= 1:
        return 0
    return count(S, m-1, n) + count(S, m, n-S[m-1])

arr = [2,5,3,6]
m = len(arr)
n = 10

print(count(arr, m, n))