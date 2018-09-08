function destroyer(...args) {

  // set targets
  var targets = args.slice(1);

  // remove targets
  return args[0].filter(function(element) {
    // only filters items that indexOf === -1
    return targets.indexOf(element) === -1;
  });
}

console.log(destroyer(["tree", "hamburger", 53], "tree", 53));
console.log(destroyer([3, 5, 1, 2, 2], 2, 3, 5));
console.log(destroyer([1, 2, 3, 5, 1, 2, 3], 2, 3));
