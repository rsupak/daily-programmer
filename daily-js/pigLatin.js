
function translatePigLatin(str) {
  let vowels = ['a', 'e', 'i', 'o', 'u'];
  if (vowels.includes( str.toLowerCase()[0] )) {
    return str.slice(0) + "way";
  }
  for (let i = 0; i < str.length; i++) {
    if(vowels.indexOf(str[i]) > -1) {
      let stringStart = str.slice(0, i);
      let stringMiddle = str.slice(i, str.length);
      return stringMiddle + stringStart + "ay";
    }
  }
  if (vowels.indexOf(str === -1)) {
    return str + "ay";
  }
}

console.log(translatePigLatin("praise"));
