const bubblesort = arr => {
  let sorted = true
  while(sorted) {
    sorted = false
    for(let idx = 0; idx < arr.length - 1; idx++) {
      if(arr[idx] > arr[idx + 1]) {
        [arr[idx], arr[idx + 1]] = [arr[idx + 1], arr[idx]];
        sorted = true
      }
    }
  }
  return arr;
}

let x = bubblesort([-21, 67, 13, 37, 33, 73, 50, 93, 57, -39])
console.log(x)
