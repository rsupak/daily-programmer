def aux_sort(num1,num2):
    total = num1 + num2
    num2 = max(num1,num2)
    num1 = total - num2

    return num1, num2


def sorted3(a,b,c):
    print(f"Input : a = {a} b = {b} c = {c}")
    b,c = aux_sort(b,c)
    a,b = aux_sort(a,b)
    b,c = aux_sort(b,c)

    return f"Sorted Numbers : {a} {b} {c}"

print(sorted3(6, 21, 5))