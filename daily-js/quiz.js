/*    JavaScript Basics Quiz   */
/* Copy the following code into JS Bin correct the code in order to get t
he correct outcome.
The expected outcome will look like this: => <outcome>
*/

// 1. Correctly assign the following variable to the value of 2.

var num = 2;
console.log(num) // => 2

/* 2. Using the following code snippet, replace the _ with the appropriate
variables in order to return the string "fizz" */

var x = 3;
var y = 5;
var z = 12;

if (z % x === 0) {
  console.log("fizz");
} else {
  console.log("buzz");
}

// // => "fizz"

// // 3. In the following snippet, what is the error ?

  var greeting = "hello";

if (greeting == "hello") {
  console.log("hi");
} else {
  console.log("goodbye");
}

// // => "hi"

// // 4.What is logged in the console from the following loop ?

  for (var i = 0; i <= 10; i++) {
    console.log(i);
  }

// // => 
// // 0
// // 1
// // 2
// // 3
// // 4
// // 5
// // 6
// // 7
// // 8
// // 9

// // 5.Fix the error(s) in the following code:

for (var i = 0; i > 0; i++) {
  console.log(i);
}

// // => 
// // 10
// // 9
// // 8
// // 7
// // 6
// // 5
// // 4
// // 3
// // 2
// // 1

// // 6. Fix the error in the following while loop?
var i = 0
while (i < 10) {
  console.log(i);
  i++
}

// // => 
// // 0
// // 1
// // 2
// // 3
// // 4
// // 5
// // 6
// // 7
// // 8
// // 9


// /* 7.Complete the following function so that it will fulfill the "FizzBuzz" 
// programming requirements: If a number is divisible by 3, log "Fizz" to the 
// console. If a number is divisible by 5, log "Buzz" to the console. If a 
// number is divisible by both 3 and 5, log "FizzBuzz" to the console. If a 
// number is not divisible by either 3 or 5, log the number to the console. */


// function fizzBuzz(number) {
//   if (/* replace code here> */ || /* replace code here */) {

//     console.log("FizzBuzz");

//   } else if (/* replace code here */) {

//     console.log("Fizz");

//   } else if (/* replace code here */) {

//     console.log("Buzz");

//   } else {
//     console.log(number);
//   }
// }


// fizzBuzz(32) // => 32
// fizzBuzz(21) // => "Fizz"
// fizzBuzz(25) // => "Buzz"
// fizzBuzz(435) // => "FizzBuzz"
