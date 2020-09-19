const sillyYears = year => {
  let yearArray = []
  let tempYear = year
  while (yearArray.length < 5) {
    tempYear -= 1
    if (validYear(tempYear)) {
      yearArray.push(tempYear)
    }
  }
  tempYear = year
  while (yearArray.length < 10) {
    tempYear += 1
    if (validYear(tempYear)) {
      yearArray.push(tempYear)
    }
  }
    
  return yearArray
}

const validYear = year => {
    let firstNum = Math.floor(year / 100)
    let secondNum = year - firstNum * 100
    let midNum = (firstNum % 10) * 10 + (secondNum - secondNum % 10) / 10
    return firstNum + secondNum == midNum
}

console.log(sillyYears(1978));
