function findHeaterRadius(houses, heaters) {
  if (heaters.length === 1) {
    let firstHalf = heaters[0] - houses[0];
    let secondHalf = houses[houses.length - 1] - heaters[0];
    return Math.max(firstHalf, secondHalf);
  }
  let difference = -Infinity;
  for (let i = 1; i < heaters.length; i++) {
    difference = Math.max(difference, Math.ceil((heaters[i] - heaters[i - 1] - 1) / 2));
  }
  let leftDiff = heaters[0] - houses[0], rightDiff = houses[houses.length - 1] - heaters[heaters.length - 1];
  let max = Math.max(leftDiff, rightDiff);
  return Math.max(difference, max);
}
const H1 = [1,2,3], HE1 = [2];
const H2 = [1,2,3,4], HE2 = [1,4];
const H3 = [1,2,3,4,5,6], HE3 = [2,6];
console.log(findHeaterRadius(H1, HE1));
console.log(findHeaterRadius(H2, HE2));
console.log(findHeaterRadius(H3, HE3));
