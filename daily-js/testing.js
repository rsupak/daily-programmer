
const vowels = ['a', 'e', 'i', 'o', 'u'];
const getPositionOfFirstVowel = (str) => vowels.includes( str[0] );

const translateWordToPigLatin = (word) => {
  const positionOfFirstVowel = getPositionOfFirstVowel(word);
  if(0 === positionOfFirstVowel)
     return formatVowelStartToPigLatin(word);
  if(null === positionOfFirstVowel)
    //I recommend return null or -1 rather than word.length if its not found - far less confusing that way
   return formatNoVowelToPigLatin(word);
 return formatConstanantStartToPigLatin(word);
}


console.log(translateWordToPigLatin("Life is a highway"))
