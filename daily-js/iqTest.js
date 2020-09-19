function iqTest(numbers){
    
  var evens = [];
  var odds = [];

  //turn string into an array by spaces and turn the string into a number with that nifty .map() function
  var array = numbers.split(" ").map(x => parseInt(x));

  for (var i of array) {
    //use modulus to find even / odd
    if (i % 2 == 1){
        odds.push(i);
    } else {
        evens.push(i);
    }
  }

  //return statement should be array[i]+1 ?
  if (evens.length > 1) {
    return array.indexOf(odds[0]) + 1
  } else {
    return array.indexOf(evens[0]) + 1
  }
}
let str1 = "2 4 7 8 10";
let str2 = "2 4 6 8 9";
let str3 = "1 3 5 7 8";
console.log(iqTest(str1))
console.log(iqTest(str2))
console.log(iqTest(str3))


/*
the for-of loop takes a look at each item in an array starting at index 0
array = [2, 4, 7, 8, 10]

it will loop 5 times
loop 1: "Hey, is 2 odd? " # the if (i % 2 == 1) part
  -- nope <throw 2 in the even bucket>
loop 2: "Hey, is 4 odd?"
  -- nope <throw 4 in the even bucket>
loop 3: "Hey, is 7 odd?"
  -- yup <throw 7 in the odd bucket>
loop 4: "Hey, is 8 odd?"
  -- nope <throw 8 in even bucket>
loop 5: "Hey, is 10 odd?"
  -- nope <throw 10 in the even bucket>
end loops

ok, time to check the buckets
Is there more than 1 item in the evens bucket?
  -- yup
ok, match the item in the odd bucket to the array.
<zero-index counter>
index 0? nope
index 1? nope
index 2? yup
Found It!
ok, but now we have to count like a human, so add 1

Return index 3

*/
