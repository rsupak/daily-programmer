def search(arr, tgt, low, high):
  if len(arr) == 0:
    return False
  
  mid = low + (high - low) // 2

  
  if arr[mid] > tgt:
    return search(arr, tgt, low, mid - 1)
  else:
    return search(arr, tgt, mid + 1, high)

arr = [1,2,2,3,4]
print(search(arr, 2, 0, len(arr)-1))
