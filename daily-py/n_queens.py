def odd_queens(num):
    queen_locations = []
    # start (0,0)
    queens = num
    x, y = 0, 0
    # for i in range(n):
    for _ in range(num):
        # roll indices around borders cases
        if x > num - 1:
            x = x - num
        if y > num - 1:
            y = y - num
        queen_locations.append((x,y))
        # Move to next location || Down: 2, Right: 1
        queens -= 1
        x += 1
        y += 2

    return queen_locations


def even_queens(num):
    queen_locations = []
    queens = num
    x1, y1 = 0, int(num/2)-1
    x2, y2 = num-1, int(num/2)

    for _ in range(int(num/2)):
        # roll indices around borders cases
        if x1 > num - 1:
            x1 = x1 - num
        if y1 > num - 1:
            y1 = y1 - num
        queen_locations.append((x1,y1))
        # Move to next location || Down: 2, Right: 1
        queens -= 1
        x1 += 1
        y1 += 2
    
    for _ in range(int(num/2)):
        # roll indices around borders cases
        if x2 < 0:
            x2 = x2 + num
        if y2 < 0:
            y2 = y2 + num
        queen_locations.append((x2,y2))
        # Move to next location || Down: 2, Right: 1
        queens -= 1
        x2 -= 1
        y2 -= 2
    
    return queen_locations


def n_queens(num):
    if num % 2 == 0:
        return even_queens(num)
    else:
        return odd_queens(num)

print(n_queens(5))
print(n_queens(8))