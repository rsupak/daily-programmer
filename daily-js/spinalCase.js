
function spinalCase(str) {
  // "It's such a fine line between stupid, and clever."
  return str.split(/(?=[A-Z])|-|_|\s/).join('-').toLowerCase();
  // --David St. Hubbins
}

console.log(spinalCase("thisIsSpinalTap"));
console.log(spinalCase("This Is Spinal Tap"));
console.log(spinalCase("The_Andy_Griffith_Show"));
console.log(spinalCase("AllThe-small Things"));
