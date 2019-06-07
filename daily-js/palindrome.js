

function palindrome(str) {
  str = str.toLowerCase().replace(/[_-\s\W]/g, '');
  return str === str.split('').reverse().join('');
}


console.log(palindrome("race_c *ar"));
