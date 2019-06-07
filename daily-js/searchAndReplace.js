'use strict';
function myReplace(str, before, after) {
  const capitalizeFirstLetter = (str) => str.charAt(0).toUpperCase() + str.slice(1);
  let sentenceToBeSearched = str.split(' ');
  let len = sentenceToBeSearched.length
  for (let word = 0; word < len; word++) {
    if (sentenceToBeSearched[word] === before) {
      if (before[0] === before[0].toUpperCase()) {
        after = capitalizeFirstLetter(after);
        sentenceToBeSearched[word] = after;
        return sentenceToBeSearched.join(' ');
      }
      sentenceToBeSearched[word] = after;
      return sentenceToBeSearched.join(' ');
    }
  }
}

console.log(myReplace("This has a spellngi error", "spellngi", "spelling"));
