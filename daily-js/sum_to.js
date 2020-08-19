const sum_to = num => {
  return num == 0 ? num : num + sum_to(num - 1)
}

console.log(sum_to(10))
