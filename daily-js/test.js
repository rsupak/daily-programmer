'use strict';
const Person = function(firstAndLast) {
  let firstName = firstAndLast.split(' ')[0];
  let lastName = firstAndLast.split(' ')[1];

  this.getFullName = function() {
    return firstName + ' ' + lastName;
  };
  this.getFirstName = function() {
    return firstName;
  };
  this.getLastName = function() {
    return lastName;
  };
  this.setFirstName = function(first) {
    firstName = first;
  };
  this.setLastName = function(last) {
    lastName = last;
  };
  this.setFullName = function(newName) {
    this.setFirstName(newName.split(' ')[0]) = firstName;
    this.setLastName(newName.split(' ')[1]) = lastName;
  };

};

var bob = new Person('Bob Ross');
console.log(bob.getFirstName())
console.log(bob.getFullName())
