const getWins = (a, b) => {
  let wins = [0,0];
  for (let i = 0; i < a.length; i++) {
    a[i] > b[i] ? wins[0]++ : b[i] > a[i] ? wins[1]++ : wins
  }
  return wins
}
