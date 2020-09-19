def count_num(arr, tgt, low, high):
  if len(arr) == 0:
    return 0
  
  if arr[low] == tgt and arr[high] == tgt:
    return (high - low) + 1 # zero index shift
  

  if arr[low] < tgt and arr[high] > tgt:
    return count_num(arr, tgt, low+1, high-1)
  elif arr[low] < tgt and arr[high] == tgt:
    return count_num(arr, tgt, low+1, high)
  elif arr[low] == tgt and arr[high] > tgt:
    return count_num(arr, tgt, low, high-1)
  else:
    return 0

arr = [1,2,2,2,2,2,2,2,2]
tgt = 2
low = 0
high = len(arr) -1
print(count_num(arr, tgt, low, high))
