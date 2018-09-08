// 'use strict';
// const getFirstMissingLetter = (str) => {
//   let letterNumber = str.charCodeAt(0);
//   for (let letter of str) {
//     if (letterNumber !== letter.charCodeAt()) {
//       return String.fromCharCode(letterNumber);
//     }
//     letterNumber++;
//   }
// }


const getFirstMissingLetter = (str) => {
  let index, nextExpectedCharCode;
  for(
    index = 1, nextExpectedCharCode = str.charCodeAt(0) + 1;
    index < str.length && str.charCodeAt(index) === nextExpectedCharCode;
    index++ , nextExpectedCharCode++
  ) {} //look ma, no loop body!!!!

  return (index < str.length) ? String.fromCharCode(nextExpectedCharCode) : undefined;
}


// const getFirstMissingLetter = (str) => {
//   for (
//     let index = 1, nextExpectedCharCode = str.charCodeAt(0) + 1;
//     index < str.length;
//     index++, nextExpectedCharCode++
//   )
//     if (str.charCodeAt(index) !== nextExpectedCharCode)
//     return String.fromCharCode(nextExpectedCharCode);
// }

console.log(getFirstMissingLetter("abce")); //should return "d"
console.log(getFirstMissingLetter("abcdefghjklmno")) //should return "i"
console.log(getFirstMissingLetter("stvwx")) //should return "u"
console.log(getFirstMissingLetter("bcdf")) //should return "e"
console.log(getFirstMissingLetter("abcdefghijklmnopqrstuvwxyz")) //should return undefined
