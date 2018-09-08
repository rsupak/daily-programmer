"use strict";
const characterSwap = {
  "&" : "&amp;",
  "<" : "&lt;",
  ">" : "&gt;",
  "\"" : "&quot;",
  "'" : "&apos;",
}
function convertHTML(str) {
  let letterArray = str.split("");
  for (let i = 0; i < letterArray.length; i++) {
    characterSwap.hasOwnProperty(letterArray[i]) ? letterArray[i] = characterSwap[letterArray[i]] : letterArray[i];
  }
  return letterArray.join('');
}

console.log(convertHTML("Dolce & Gabbana"));
console.log(convertHTML("Hamburgers < Pizza < Tacos"));
console.log(convertHTML("Sixty > twelve"));
console.log(convertHTML('Stuff in "quotation marks"'));
console.log(convertHTML("Schindler's List"));
console.log(convertHTML("<>"));
console.log(convertHTML("abc"));


// & &amp;
// < &lt;
// > &gt;
// " &quot;
// ' &apos;

// const characterSwap = {
//   "&" : "&amp;",
//   "<" : "&lt;",
//   ">" : "&gt;",
//   `"` : "&quot;",
//   "'" : "&apos;",
// }

// if (arr[i] === "&") {
//   arr[i] = "&amp;";
// } else if (arr[i] === "<") {
//   arr[i] = "&lt;";
// } else if (arr[i] === ">") {
//   arr[i] = "&gt;";
// } else if (arr[i] === "\"") {
//   arr[i] = "&quot;";
// } else if (arr[i] === "'") {
//   arr[i] = "&apos;";
// }
