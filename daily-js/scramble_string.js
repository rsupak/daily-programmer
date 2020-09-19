const scramble_string = (str, scramble) => scramble.map(x => str[x]).join('');

let str = 'abcd';
let scramble = [3,1,2,0];

console.log(scramble_string(str, scramble));
console.log(str);
console.log(scramble);
