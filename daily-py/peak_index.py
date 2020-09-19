# def mountainPeek(A):
# 	  left, right = 0, len(A) - 1

# 	  while left < right:
#       mid = left + (right - left >> 1)
# 	  if A[mid] < A[mid + 1]:
# 		  left = mid + 1
# 	  else:
# 		  right = mid
# 	  return left

def mountainPeak(A):
    left, right = 0, len(A) - 1
    while left < right:
        mid = left + (right - left >> 1)
        if A[mid] < A[mid + 1]:
            left = mid + 1
        else:
            right = mid
    return left

print(mountainPeak([0, 1, 2, 1, 3, 0]))
