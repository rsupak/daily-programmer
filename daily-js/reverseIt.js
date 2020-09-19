// const isLetter = char => (/[a-z]/i).test(char)

// const reverseIt = str => {
//   str = str.split('')
//   let left = 0;
//   let right = str.length - 1;
//   while (left < right) {
//     left = isLetter(str[left]) ? left : left + 1;
//     right = isLetter(str[right]) ? right : right - 1;
//     [str[left], str[right]] = [str[right], str[left]]
//     left++;
//     right--;
//   }
//   return str.join('');
// }

// let str = 'Test1ng-Leet=code-Q!'
// console.log(reverseIt(str))

// const reverseLettersOnly = (str) => {
//   let result = ``
//   const reversed = reversedLetters(str)
//   for (let c of str)
//     result += !isLetter(c) ? c : reversed.next().value
//   return result
// }

const isLetter = char => (/[a-z]/i).test(char)

// Generates chars from the string at index if the char isLetter
const reversedLetters = function* (str) {
  for (let i = str.length - 1; i >= 0; i -= 1) {
    const c = str[i]
    if (isLetter(c))
      yield c
  }
}

// Generates letters from reversed string and chars from regular string
const reverseLettersOnlyIterator = function* (str) {
  const reversed = reversedLetters(str)
  for (let c of str)
    yield !isLetter(c) ? c : reversed.next().value
}

// Builds array from the generator and joins the array to return a string
const reverseLettersOnly = (str) => Array.from(reverseLettersOnlyIterator(str)).join(``)

let str = 'Test1ng-Leet=code-Q!'
console.log(reverseLettersOnly(str))
