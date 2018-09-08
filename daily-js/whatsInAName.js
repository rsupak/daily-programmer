'use strict';

function whatIsInAName(collection, source) {
  var arr = [];
  const keys = Object.keys(source);
  arr = collection
    .filter( (obj) => keys.every((key) => obj
      .hasOwnProperty(key) && obj[key] === source[key]));
  return arr;

}


console.log(whatIsInAName([{ first: "Romeo", last: "Montague" }, { first: "Mercutio", last: null }, { first: "Tybalt", last: "Capulet" }], { last: "Capulet" }));
console.log(whatIsInAName([{ "apple": 1, "bat": 2 }, { "bat": 2 }, { "apple": 1, "bat": 2, "cookie": 2 }], { "apple": 1, "bat": 2 }));
