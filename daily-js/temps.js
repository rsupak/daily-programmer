function temp(tempList) {
  // two pointers
  let returnList = [];
  let i = 0;
  let j = 1;

  console.log(tempList.length);
  console.log(8 < tempList.length);

  while (j < tempList.length) {
    if (tempList[j] > tempList[i]) {
      returnList.push(j - i);
      i++;
      j = i;
    }
    j++;
  }

  if (returnList.length < tempList.length) {
    let listDifference = tempList.length - returnList.length;
    for (let i = 0; i < listDifference; i++) {
      returnList.push(0);
    }
  }

  return returnList;
}

console.log(temp([73, 74, 79, 71, 69, 72, 76, 73]));
