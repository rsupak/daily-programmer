`use strict`;

const keys = { "M": 1000, "CM": 900, "D": 500, "CD": 400, "C": 100, "XC": 90, "L": 50, "XL": 40, "X": 10, "IX": 9, "V": 5, "IV": 4, "I": 1 }

romanNumber = ""

const convertToRoman = (num) => {
  if (num <= 0) {
    return romanNumber;
  }
  for (let key in keys) {
    let value = keys[key];
    if (num >= value) {
      romanNumber += key;
      num -= value;
      return convertToRoman(num)
    }
  }
}

console.log(convertToRoman(25));
