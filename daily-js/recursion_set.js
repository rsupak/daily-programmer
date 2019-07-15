const sumTo = num => {
  if (num < 0) return null
  return num == 0 ? num : num + sumTo(num - 1)
}

const addNumbers = arr => {
  if (arr.length == 0) return null;
  return arr.length == 1 ? arr.pop() : arr.shift() + addNumbers(arr)
}

const gammaFunction = num => {
  if (num == 0) return null;
  return num == 1 ? num : (num - 1) * gammaFunction(num - 1)
}

const reverseString = string => {
  if (string.length == 0) return string
  return string.length == 1 ? string : reverseString(string.slice(1, string.length)) + string[0]
}

