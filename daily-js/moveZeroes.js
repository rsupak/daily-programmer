const moveZeroes = arr => {
    let zeroCounter = 0;
    const numberZero = 0;
    for (let i = arr.length -1; i >=0; i--) {
      if (arr[i] === 0) {
        zeroCounter++;
        arr.splice(i,1);
      }
    }
    for (let currentCount = 0; currentCount < zeroCounter; currentCount++) {
      arr.push(0);
    }
    return arr;
  }
  
  let x = moveZeroes([1,2,3,0,0,0,1,6,0]);
  console.log(x);