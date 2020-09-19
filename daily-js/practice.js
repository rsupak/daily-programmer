function helloES6(greeting, name) {
  console.log(`${greeting}, ${name}!`)
}

// helloES6("Hello", "Michael")

function helloES5(greeting, name) {
  console.log(greeting + ', ' + name + "!")
}

// helloES5("Hello", "George")

var helloArrow = (greeting, name) => {
  console.log(`${greeting}, ${name}!`)
}

// helloArrow("Hello", "Anne")


var hello = function(greeting, name) {
  console.log(greeting + ', ' + name + "!")
}

// hello("Hola", "James")

function fizzBuzz(maxNum) {
  var count = 1
  var output = []
  while (count < maxNum) {
    if (count % 3 == 0 && count % 5 == 0) {
      output.unshift("FizzBuzz")
    } else if (count % 3 == 0) {
      output.unshift("Fizz")
    } else if (count % 5 == 0) {
      output.unshift("Buzz")
    } else {
      output.unshift(count)
    }
    count++
  }
  while (output.length) {
    console.log(output.pop())
  }
}

// fizzBuzz(32)

function chessboard(size) {
  for (var i = 1; i <= size; i++) {
    var oddRow = " # # # #"
    var evenRow = oddRow.split("").reverse().join("")
    if (i % 2 == 0) {
      console.log(evenRow)
    } else {
      console.log(oddRow)
    }
  }
  return 
}

chessboard(4)

