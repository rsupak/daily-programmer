// Takes in a string and trans-literates it into Pig Latin.

'use strict';

const vowels = ['a', 'e', 'i', 'o', 'u'];
const isFirstLetterAVowel = (str) => vowels.includes( str[0] );

function translate(str) {
  let arr = str.split(' ');
  let newArr = [];
  for (let word of arr) {
    if (isFirstLetterAVowel(word)) {
      newArr.push(word + "way");
    } else if (!isFirstLetterAVowel(word)){
      // check for vowels within the words
      let letterPosition = 0;
      while (vowels.indexOf(word[letterPosition]) < 0 && letterPosition < word.length) {
        letterPosition++
      }
      // if no vowels return string + 'ay'
      if (letterPosition === word.length) {
        newArr.push(word + "ay")
      }
      // if word contains vowels, break the string before first vowel and pig-latin it.
      else {
        let stringStart = word.slice(0,letterPosition);
        let stringMiddle = word.slice(letterPosition, word.length);
        newArr.push(stringMiddle + stringStart + "ay");
      }
    }
  }
  return newArr.join(' ');
}

console.log(translate("Life is a highway"))
