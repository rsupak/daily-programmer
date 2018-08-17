const MAX_INT = 2147483647;
const precision = 0.001;
const getNthRoot = (a, n) => {
    let prevX = 1;
    let currX = 0.0;
    let diffX = MAX_INT;

    while (diffX > precision) {
        currX = (1/n) * ((n-1) * prevX + a/(prevX**(n-1)));
        diffX = currX - prevX >= 0 ? currX - prevX : prevX - currX;
        prevX = currX;
    }
    return currX.toFixed(3);
}

console.log(getNthRoot(7,3));