function longestPrefix(arr) {
  if (!arr.length) {
    return "";
  }

  let longest = "";
  let lengths = arr.map(x => x.length);
  let minLength = Math.min.apply(null, lengths);

  let i = 0;
  let commonPrefix = "arr[0][i]";
}
