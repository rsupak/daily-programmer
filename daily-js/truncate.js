
truncateString = (str, num) => {
  if (num < 3) {
    return str.slice(0, num) + "...";
  } else if (str.length > num) {
    return str.slice(0, num) + "...";
  } else if (num >= str.length) {
    return str;
  }
}

console.log(truncateString("A-tisket a-tasket A green and yellow basket", 8));
