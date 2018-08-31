MAX_INT = 2147483647

def get_nth_root(a, n):
    # derivative of Newton-Rhapson
    # x(k + 1) = (1/n) * ((n-1) * x(k) + a / x(k) ^ (n - 1))

    prev_x = 1
    curr_x = 0.0
    precision = .001

    # set current_x to highest possible int (32-bit)
    # then converge on n'th root to the required precision
    diff_x = MAX_INT

    while diff_x > precision:
        curr_x = (1/n) * ((n-1) * prev_x + a/(prev_x**(n-1)))
        diff_x = curr_x - prev_x if curr_x - prev_x >= 0 else prev_x - curr_x
        prev_x = curr_x
    return '%s' % float('%.4g' % curr_x)

print(get_nth_root(7,3))

