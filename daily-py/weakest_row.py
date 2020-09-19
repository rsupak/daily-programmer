
def weakest_row(mat, k):
    mat = list(enumerate(list(map(lambda x: sum(x), mat))))
    mat.sort(key=lambda x: x[1])
    return list(map(lambda x: x[0], mat))[0:k]

mat = [[1,1,0,0,0],
       [1,1,1,1,0],
       [1,0,0,0,0],
       [1,1,0,0,0],
       [1,1,1,1,1]]

print(weakest_row(mat, 3))


# def weakest(mat, k):
#   return list(map(lambda y: y[0], sorted(enumerate(map(lambda x: sum(x), mat)), key=lambda x: x[1])))[0:k]
