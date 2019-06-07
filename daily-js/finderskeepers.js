function findElement(arr, func) {
  for (let i = 0; i < arr.length; i++) {
    if (func(arr[i])) {
      return(arr[i]);
    }
  }
}

console.log(findElement([1,2,3,4], function(num){ return num % 2 === 0; }));
