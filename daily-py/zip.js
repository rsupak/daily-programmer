let zip = ([a, b, c]) => {
  let result = "";
  for (let key in a) {
    if (a[key]) result += a[key];
    if (b[key]) result += b[key];
    if (c[key]) result += c[key];
  }

  return result;
};

console.log(zip(["adgjmpsvy", "behknqtwz", "cfilorux"]));
