const clumsyFactorial = n => {
  let s = ''
  let ops = ['*', '/', '+', '-']
  let opsp = 0
  for (let i = n; i > 0; i--) {
    s += `${opsp==0?'parseInt(':''}${i}${opsp==2?')':''}${ops[opsp++]}`
    opsp %= 4
  }
  return eval(s.substring(0, s.length - 1) + ')')
}
console.log(clumsyFactorial(21));
