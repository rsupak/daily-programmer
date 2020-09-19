# def numberOfLinesI(widths, S):
#     units = 0
#     lines = 1
#     for char in S:
#         units += widths[ord(char) - ord("a")]
        
#         # move to a new line
#         if units > 100:
#             units = widths[ord(char) - ord("a")]
#             lines += 1
        
#     return [lines, units]
from functools import reduce

def line_numbers(widths, string):
    str_widths = list(map(lambda x: widths[ord(x) - ord('a')], list(string)))
    str_len = sum(list(str_widths), 0)
    current_width = reduce(lambda x, y: x + y if x + y < 100 else y, str_widths)
    lines = str_len // 100 + 1 if str_len > 100 else str_len
    return [lines, current_width]

widths = [4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
s = "bbbcccdddaaa"
print(line_numbers(widths, s))
